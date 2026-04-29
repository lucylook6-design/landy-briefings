-- ============================================================================
-- HR智能体 v2.0 数据库迁移脚本
-- ============================================================================
-- 版本: v2.0.0
-- 日期: 2026-04-28
-- 描述: BOSS直聘自动化和Word导出功能数据库变更
-- ============================================================================

BEGIN;

-- ============================================================================
-- 1. 删除废弃字段
-- ============================================================================

-- 1.1 删除JOB表的联系人字段（联系人信息已移至CLIENT表）
ALTER TABLE jobs DROP COLUMN IF EXISTS contact_name;
ALTER TABLE jobs DROP COLUMN IF EXISTS contact_phone;

-- 1.2 删除SCREENING_TASK表的触发类型字段（不再支持定时触发）
ALTER TABLE screening_tasks DROP COLUMN IF EXISTS trigger_type;

-- ============================================================================
-- 2. 更新PLATFORM_ACCOUNT表（支持自动化功能）
-- ============================================================================

-- 2.1 添加自动化相关字段
ALTER TABLE platform_accounts 
ADD COLUMN IF NOT EXISTS automation_enabled BOOLEAN DEFAULT false 
  COMMENT '是否启用自动化',
ADD COLUMN IF NOT EXISTS last_automation_at TIMESTAMP 
  COMMENT '最后一次自动化时间',
ADD COLUMN IF NOT EXISTS automation_status VARCHAR(20) DEFAULT 'idle' 
  COMMENT '自动化状态: idle/running/failed';

-- 2.2 添加约束
ALTER TABLE platform_accounts 
ADD CONSTRAINT chk_automation_status 
  CHECK (automation_status IN ('idle', 'running', 'failed'));

-- 2.3 添加注释
COMMENT ON COLUMN platform_accounts.automation_enabled IS '是否启用BOSS直聘自动化功能';
COMMENT ON COLUMN platform_accounts.last_automation_at IS '最后一次执行自动化的时间';
COMMENT ON COLUMN platform_accounts.automation_status IS '当前自动化状态：idle-空闲，running-运行中，failed-失败';

-- ============================================================================
-- 3. 创建AUTOMATION_LOG表（自动化操作日志）
-- ============================================================================

CREATE TABLE IF NOT EXISTS automation_logs (
  -- 主键
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- 外键
  job_id UUID NOT NULL REFERENCES jobs(id) ON DELETE CASCADE 
    COMMENT '关联的招聘需求ID',
  platform_account_id UUID NOT NULL REFERENCES platform_accounts(id) ON DELETE CASCADE 
    COMMENT '使用的平台账号ID',
  
  -- 操作信息
  action_type VARCHAR(20) NOT NULL 
    COMMENT '操作类型: search/greet/download',
  status VARCHAR(20) NOT NULL 
    COMMENT '状态: success/failed',
  candidates_count INTEGER 
    COMMENT '处理的候选人数量',
  error_message TEXT 
    COMMENT '错误信息（失败时）',
  
  -- 元数据
  metadata JSONB 
    COMMENT '额外的元数据信息',
  
  -- 时间戳
  created_at TIMESTAMP NOT NULL DEFAULT NOW() 
    COMMENT '创建时间'
);

-- 添加约束
ALTER TABLE automation_logs 
ADD CONSTRAINT chk_action_type 
  CHECK (action_type IN ('search', 'greet', 'download'));

ALTER TABLE automation_logs 
ADD CONSTRAINT chk_status 
  CHECK (status IN ('success', 'failed'));

-- 添加表注释
COMMENT ON TABLE automation_logs IS 'BOSS直聘自动化操作日志表';
COMMENT ON COLUMN automation_logs.id IS '日志ID';
COMMENT ON COLUMN automation_logs.job_id IS '关联的招聘需求ID';
COMMENT ON COLUMN automation_logs.platform_account_id IS '使用的平台账号ID';
COMMENT ON COLUMN automation_logs.action_type IS '操作类型：search-搜索候选人，greet-发送打招呼，download-下载简历';
COMMENT ON COLUMN automation_logs.status IS '操作状态：success-成功，failed-失败';
COMMENT ON COLUMN automation_logs.candidates_count IS '本次操作处理的候选人数量';
COMMENT ON COLUMN automation_logs.error_message IS '操作失败时的错误信息';
COMMENT ON COLUMN automation_logs.metadata IS 'JSON格式的额外元数据，如候选人信息、搜索条件等';
COMMENT ON COLUMN automation_logs.created_at IS '日志创建时间';

-- ============================================================================
-- 4. 创建索引（优化查询性能）
-- ============================================================================

-- 4.1 PLATFORM_ACCOUNT表索引
CREATE INDEX IF NOT EXISTS idx_platform_accounts_automation_status 
ON platform_accounts(automation_status)
WHERE automation_status != 'idle';

CREATE INDEX IF NOT EXISTS idx_platform_accounts_client_platform 
ON platform_accounts(client_id, platform);

-- 4.2 AUTOMATION_LOG表索引
CREATE INDEX IF NOT EXISTS idx_automation_logs_job_id 
ON automation_logs(job_id);

CREATE INDEX IF NOT EXISTS idx_automation_logs_created_at 
ON automation_logs(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_automation_logs_status 
ON automation_logs(status)
WHERE status = 'failed';

CREATE INDEX IF NOT EXISTS idx_automation_logs_job_created 
ON automation_logs(job_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_automation_logs_action_type 
ON automation_logs(action_type);

-- 4.3 其他优化索引
CREATE INDEX IF NOT EXISTS idx_candidates_task_rank 
ON candidates(task_id, rank);

CREATE INDEX IF NOT EXISTS idx_resumes_platform_account 
ON resumes(platform_account_id, uploaded_at DESC);

CREATE INDEX IF NOT EXISTS idx_user_company_user_client 
ON user_company(user_id, client_id);

-- ============================================================================
-- 5. 更新RLS策略（行级安全）
-- ============================================================================

-- 5.1 为AUTOMATION_LOG表启用RLS
ALTER TABLE automation_logs ENABLE ROW LEVEL SECURITY;

-- 5.2 创建RLS策略：用户只能访问其授权企业的自动化日志
DROP POLICY IF EXISTS user_company_isolation ON automation_logs;

CREATE POLICY user_company_isolation ON automation_logs
  USING (job_id IN (
    SELECT j.id FROM jobs j
    JOIN user_company uc ON j.client_id = uc.client_id
    WHERE uc.user_id = current_setting('app.current_user_id')::uuid
  ));

-- 5.3 验证其他表的RLS策略是否存在
DO $$
BEGIN
  -- 检查jobs表RLS
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'jobs' AND policyname = 'user_company_isolation'
  ) THEN
    CREATE POLICY user_company_isolation ON jobs
      USING (client_id IN (
        SELECT client_id FROM user_company 
        WHERE user_id = current_setting('app.current_user_id')::uuid
      ));
  END IF;
  
  -- 检查screening_tasks表RLS
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'screening_tasks' AND policyname = 'user_company_isolation'
  ) THEN
    CREATE POLICY user_company_isolation ON screening_tasks
      USING (job_id IN (
        SELECT j.id FROM jobs j
        JOIN user_company uc ON j.client_id = uc.client_id
        WHERE uc.user_id = current_setting('app.current_user_id')::uuid
      ));
  END IF;
  
  -- 检查candidates表RLS
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'candidates' AND policyname = 'user_company_isolation'
  ) THEN
    CREATE POLICY user_company_isolation ON candidates
      USING (task_id IN (
        SELECT st.id FROM screening_tasks st
        JOIN jobs j ON st.job_id = j.id
        JOIN user_company uc ON j.client_id = uc.client_id
        WHERE uc.user_id = current_setting('app.current_user_id')::uuid
      ));
  END IF;
  
  -- 检查resumes表RLS
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'resumes' AND policyname = 'user_company_isolation'
  ) THEN
    CREATE POLICY user_company_isolation ON resumes
      USING (platform_account_id IN (
        SELECT pa.id FROM platform_accounts pa
        JOIN user_company uc ON pa.client_id = uc.client_id
        WHERE uc.user_id = current_setting('app.current_user_id')::uuid
      ));
  END IF;
END $$;

-- ============================================================================
-- 6. 数据迁移（如果需要）
-- ============================================================================

-- 6.1 为现有PLATFORM_ACCOUNT记录设置默认值
UPDATE platform_accounts 
SET automation_enabled = false,
    automation_status = 'idle'
WHERE automation_enabled IS NULL;

-- ============================================================================
-- 7. 创建辅助函数
-- ============================================================================

-- 7.1 获取自动化统计信息
CREATE OR REPLACE FUNCTION get_automation_stats(
  p_job_id UUID,
  p_start_date TIMESTAMP DEFAULT NOW() - INTERVAL '30 days',
  p_end_date TIMESTAMP DEFAULT NOW()
)
RETURNS TABLE (
  total_actions INTEGER,
  success_count INTEGER,
  failed_count INTEGER,
  success_rate NUMERIC,
  total_candidates INTEGER
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    COUNT(*)::INTEGER AS total_actions,
    COUNT(*) FILTER (WHERE status = 'success')::INTEGER AS success_count,
    COUNT(*) FILTER (WHERE status = 'failed')::INTEGER AS failed_count,
    ROUND(
      COUNT(*) FILTER (WHERE status = 'success')::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
    ) AS success_rate,
    COALESCE(SUM(candidates_count), 0)::INTEGER AS total_candidates
  FROM automation_logs
  WHERE job_id = p_job_id
    AND created_at BETWEEN p_start_date AND p_end_date;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION get_automation_stats IS '获取指定招聘需求的自动化统计信息';

-- 7.2 清理过期的自动化日志（保留90天）
CREATE OR REPLACE FUNCTION cleanup_old_automation_logs()
RETURNS INTEGER AS $$
DECLARE
  deleted_count INTEGER;
BEGIN
  DELETE FROM automation_logs
  WHERE created_at < NOW() - INTERVAL '90 days';
  
  GET DIAGNOSTICS deleted_count = ROW_COUNT;
  RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION cleanup_old_automation_logs IS '清理90天前的自动化日志';

-- ============================================================================
-- 8. 创建定时任务（可选，需要pg_cron扩展）
-- ============================================================================

-- 注意：需要先安装pg_cron扩展
-- CREATE EXTENSION IF NOT EXISTS pg_cron;

-- 每天凌晨2点清理过期日志
-- SELECT cron.schedule('cleanup-automation-logs', '0 2 * * *', 'SELECT cleanup_old_automation_logs()');

-- ============================================================================
-- 9. 验证迁移
-- ============================================================================

-- 9.1 验证表结构
DO $$
BEGIN
  -- 验证automation_logs表存在
  IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'automation_logs') THEN
    RAISE EXCEPTION 'Table automation_logs does not exist';
  END IF;
  
  -- 验证platform_accounts新字段存在
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'platform_accounts' AND column_name = 'automation_enabled'
  ) THEN
    RAISE EXCEPTION 'Column automation_enabled does not exist in platform_accounts';
  END IF;
  
  -- 验证jobs表字段已删除
  IF EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'jobs' AND column_name = 'contact_name'
  ) THEN
    RAISE EXCEPTION 'Column contact_name still exists in jobs table';
  END IF;
  
  RAISE NOTICE 'Migration validation passed';
END $$;

-- 9.2 显示迁移摘要
SELECT 
  'Migration completed successfully' AS status,
  NOW() AS completed_at,
  (SELECT COUNT(*) FROM automation_logs) AS automation_logs_count,
  (SELECT COUNT(*) FROM platform_accounts WHERE automation_enabled = true) AS automation_enabled_accounts;

COMMIT;

-- ============================================================================
-- 回滚脚本（如果需要回滚，请执行以下语句）
-- ============================================================================

/*
BEGIN;

-- 删除新增的表
DROP TABLE IF EXISTS automation_logs CASCADE;

-- 删除新增的字段
ALTER TABLE platform_accounts DROP COLUMN IF EXISTS automation_enabled;
ALTER TABLE platform_accounts DROP COLUMN IF EXISTS last_automation_at;
ALTER TABLE platform_accounts DROP COLUMN IF EXISTS automation_status;

-- 恢复删除的字段（需要根据实际情况调整）
ALTER TABLE jobs ADD COLUMN IF NOT EXISTS contact_name VARCHAR(100);
ALTER TABLE jobs ADD COLUMN IF NOT EXISTS contact_phone VARCHAR(20);
ALTER TABLE screening_tasks ADD COLUMN IF NOT EXISTS trigger_type VARCHAR(20) DEFAULT 'manual';

-- 删除函数
DROP FUNCTION IF EXISTS get_automation_stats;
DROP FUNCTION IF EXISTS cleanup_old_automation_logs;

-- 删除索引
DROP INDEX IF EXISTS idx_platform_accounts_automation_status;
DROP INDEX IF EXISTS idx_automation_logs_job_id;
DROP INDEX IF EXISTS idx_automation_logs_created_at;
DROP INDEX IF EXISTS idx_automation_logs_status;
DROP INDEX IF EXISTS idx_automation_logs_job_created;
DROP INDEX IF EXISTS idx_automation_logs_action_type;

COMMIT;
*/

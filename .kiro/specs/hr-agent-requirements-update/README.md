# HR智能体 v2.0 设计文档

## 文档概览

本目录包含HR智能体v2.0版本的完整技术设计文档，基于需求变更文档v2.0.0创建。

### 文档列表

| 文档 | 描述 | 状态 |
|------|------|------|
| [requirements.md](./requirements.md) | 需求变更文档 | ✅ 已完成 |
| [design.md](./design.md) | 技术设计文档（主文档） | ✅ 已完成 |
| [api-spec.md](./api-spec.md) | API规范文档 | ✅ 已完成 |
| [database-migration.sql](./database-migration.sql) | 数据库迁移脚本 | ✅ 已完成 |

---

## 核心变更概述

### 删减功能
1. ❌ 企业微信自动交付
2. ❌ 定时筛选功能
3. ❌ 仪表盘统计卡片
4. ❌ 招聘需求联系人字段
5. ❌ 推荐理由人工编辑
6. ❌ 交付记录统计

### 新增功能
1. ✅ **BOSS直聘自动化**：自动搜索、打招呼、下载简历
2. ✅ **Word文件导出**：生成候选人推荐文档
3. ✅ **猎头员工管理**：一个猎头管理多个企业
4. ✅ **企业账号管理**：每个企业绑定BOSS直聘账号

---

## 技术架构

### 技术栈

| 层级 | 技术 |
|------|------|
| 前端 | React + TypeScript |
| 后端 | Node.js + Express |
| 浏览器自动化 | Playwright |
| 数据库 | PostgreSQL 14+ (RLS) |
| 缓存 | Redis 7+ |
| 文件存储 | 本地/S3 |
| Word生成 | docx.js |
| 大模型 | OpenAI/Claude API |
| Embedding | OpenAI text-embedding-3 |

### 核心模块

1. **BrowserAutomationService** - BOSS直聘自动化引擎
2. **WordExportService** - Word文档生成服务
3. **AuthenticationService** - 认证和权限管理
4. **CompanyManagementService** - 企业管理和切换
5. **AutomationLogService** - 自动化日志记录

---

## 设计文档导航

### 1. 需求变更文档 (requirements.md)

**内容：**
- 变更概述
- 需求变更清单（删减/调整/新增）
- 新的核心业务流程
- 数据模型变更
- 业务规则变更
- 风险评估
- 验收标准

**关键章节：**
- 第2章：需求变更清单
- 第3章：新的核心业务流程
- 第4章：数据模型变更

---

### 2. 技术设计文档 (design.md)

**内容：**
- Overview - 设计概述
- Architecture - 系统架构
- Components and Interfaces - 组件和接口设计
- Data Models - 数据模型
- API Design - API设计
- Sequence Diagrams - 序列图
- Error Handling - 错误处理
- Testing Strategy - 测试策略
- Deployment Architecture - 部署架构
- Performance Optimization - 性能优化
- Monitoring and Observability - 监控和可观测性
- Security Considerations - 安全考虑
- Migration Plan - 迁移计划

**关键章节：**
- 第2章：Architecture - 系统架构图和技术栈
- 第3章：Components and Interfaces - 核心模块设计
- 第6章：Sequence Diagrams - 业务流程序列图
- 第8章：Testing Strategy - 测试策略（不使用PBT）

**重点设计：**

#### BOSS直聘自动化
- 浏览器自动化引擎（Playwright）
- 反爬虫策略（随机延迟、鼠标模拟、浏览器指纹）
- 限流控制（遵守平台规则）
- 并发控制和浏览器实例池
- 自动化日志记录

#### Word导出
- Word模板设计
- 候选人信息布局
- AI推荐理由格式化
- 文件存储和下载链接生成

#### 数据隔离
- PostgreSQL RLS（行级安全）
- 企业切换机制
- Token中包含companyId
- 所有查询自动过滤

---

### 3. API规范文档 (api-spec.md)

**内容：**
- 认证API（登录/登出/刷新Token）
- 企业管理API（列表/切换）
- BOSS账号管理API（绑定/更新/验证）
- 招聘需求API（创建/列表/详情）
- BOSS自动化API（触发/状态/日志）
- 筛选API（触发/状态/结果）
- Word导出API（导出/下载）
- 错误代码汇总

**关键端点：**
- `POST /auth/login` - 猎头登录
- `POST /companies/{companyId}/switch` - 切换企业
- `POST /companies/{companyId}/boss-account` - 绑定BOSS账号
- `POST /jobs/{jobId}/automation/trigger` - 触发自动化
- `POST /screening-tasks/{taskId}/export/word` - 导出Word

---

### 4. 数据库迁移脚本 (database-migration.sql)

**内容：**
- 删除废弃字段（JOB.contact_name等）
- 更新PLATFORM_ACCOUNT表（新增自动化字段）
- 创建AUTOMATION_LOG表
- 创建索引（优化查询）
- 更新RLS策略
- 创建辅助函数
- 验证迁移
- 回滚脚本

**执行方式：**
```bash
psql -U postgres -d hr_agent_prod -f database-migration.sql
```

---

## 核心业务流程

### 完整工作流

```
1. 猎头登录系统
2. 选择/切换企业
3. 创建JD招聘需求
4. 触发BOSS直聘自动化
   ├─ 登录企业BOSS账号
   ├─ 搜索候选人（关键词+筛选）
   ├─ 自动打招呼（最多50人）
   └─ 下载简历到简历库
5. 系统自动解析简历
6. 触发AI筛选
   ├─ Embedding初筛（保留Top 6）
   └─ 大模型精筛（排序+推荐理由）
7. 导出Word文档
8. 猎头手动交付给甲方
```

### 关键序列图

详见 `design.md` 第6章：
- BOSS直聘自动化完整流程（30步）
- 企业切换流程（20步）
- Word导出流程（20步）

---

## 数据模型变更

### 删除字段

| 表 | 字段 | 原因 |
|----|------|------|
| jobs | contact_name | 联系人信息移至CLIENT表 |
| jobs | contact_phone | 联系人信息移至CLIENT表 |
| screening_tasks | trigger_type | 不再支持定时触发 |

### 新增字段

| 表 | 字段 | 类型 | 描述 |
|----|------|------|------|
| platform_accounts | automation_enabled | boolean | 是否启用自动化 |
| platform_accounts | last_automation_at | timestamp | 最后自动化时间 |
| platform_accounts | automation_status | enum | 自动化状态 |

### 新增表

**AUTOMATION_LOG** - 自动化操作日志
- id (UUID)
- job_id (FK)
- platform_account_id (FK)
- action_type (enum: search/greet/download)
- status (enum: success/failed)
- candidates_count (int)
- error_message (text)
- metadata (jsonb)
- created_at (timestamp)

---

## 测试策略

### PBT适用性评估

**结论：本功能不适合使用Property-Based Testing**

**原因：**
- BOSS自动化：副作用操作，外部服务交互
- Word导出：格式化输出，二进制文件
- 员工管理：简单CRUD操作
- 数据隔离：权限控制和配置

### 测试分层

| 测试类型 | 覆盖率目标 | 测量指标 |
|----------|-----------|----------|
| 单元测试 | ≥80% | 行覆盖率 |
| 集成测试 | ≥70% | API端点覆盖 |
| E2E测试 | 100% | 核心业务流程 |
| 安全测试 | 100% | 数据隔离场景 |

详见 `design.md` 第8章。

---

## 性能目标

| 指标 | 目标值 | 告警阈值 |
|------|--------|----------|
| BOSS自动化耗时 | <30分钟/50人 | >45分钟 |
| Word导出耗时 | <10秒 | >15秒 |
| API响应时间P95 | <500ms | >1000ms |
| 系统可用率 | ≥99.5% | <99% |
| 自动化成功率 | ≥80% | <70% |

---

## 安全考虑

### 1. 密码加密
- AES-256-GCM加密BOSS账号密码
- 密钥使用scrypt派生

### 2. JWT Token
- Access Token: 1小时有效期
- Refresh Token: 7天有效期
- HS256签名算法

### 3. 数据隔离
- PostgreSQL RLS行级安全
- 每个请求设置current_user_id
- 所有查询自动过滤

### 4. API限流
- 用户级别限流：100次/分钟
- BOSS平台限流：10次搜索/小时，50次打招呼/小时

详见 `design.md` 第11章。

---

## 部署架构

### 生产环境

```
负载均衡层: Nginx
应用层: Node.js x3实例
浏览器自动化层: Playwright x2实例
数据层: PostgreSQL主从 + Redis集群
存储层: S3
```

### 环境配置

详见 `design.md` 第10章。

---

## 监控指标

| 指标类别 | 关键指标 |
|----------|----------|
| 性能 | BOSS自动化耗时、Word导出耗时、API响应时间 |
| 可用性 | 系统可用率 |
| 业务 | 自动化成功率、简历解析成功率 |
| 资源 | CPU、内存、数据库连接数 |

详见 `design.md` 第12章。

---

## 实施计划

### 第一阶段：删减功能（1周）
- 删除企业微信集成
- 删除定时筛选
- 删除仪表盘统计
- 数据库字段清理

### 第二阶段：调整功能（2周）
- 实现Word导出
- 调整简历获取流程

### 第三阶段：新增功能（3周）
- 实现猎头员工管理
- 实现企业BOSS账号管理
- 实现BOSS直聘自动化

### 总计：约6周

---

## 风险和缓解

| 风险 | 概率 | 影响 | 缓解策略 |
|------|------|------|----------|
| BOSS反爬虫 | 高 | 高 | 浏览器自动化+人工行为模拟 |
| 账号封禁 | 中 | 高 | 遵守限流规则，记录日志 |
| 自动化失败率高 | 中 | 中 | 详细错误日志+重试机制 |
| Word格式兼容性 | 低 | 中 | 使用标准docx格式 |

---

## 下一步行动

1. ✅ 产品负责人审批需求变更文档
2. ✅ 技术负责人审批技术设计文档
3. ⏳ 开发团队评估工作量
4. ⏳ 开始第一阶段实施（删减功能）
5. ⏳ BOSS直聘自动化技术POC

---

## 联系方式

- **产品负责人**: [待填写]
- **技术负责人**: [待填写]
- **项目经理**: [待填写]

---

**文档版本**: v2.0.0  
**最后更新**: 2026-04-28  
**状态**: 草稿

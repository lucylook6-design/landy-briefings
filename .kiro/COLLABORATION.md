# 协作规范 - Kiro & 貔貅

## 🎯 目标
确保Kiro和貔貅在同一个仓库工作时不会相互覆盖对方的改动。

## 📋 工作分工

### Kiro负责
- 页面结构和功能开发（Tab切换、导航等）
- 知识库内容管理（添加/删除知识库链接）
- 紧急修复和功能优化
- 文档编写

### 貔貅负责
- 每日简报内容生成和归档
- 简报数据更新（REPORTS数组）
- 定时任务执行

## ⚠️ 关键规则

### 1. 推送前必须先拉取
```bash
# 任何推送前都要执行
git pull origin main --rebase
# 如果有冲突，解决后再推送
git push origin main
```

### 2. 禁止强制推送（除非紧急修复）
```bash
# ❌ 不要使用
git push origin main --force

# ✅ 使用
git push origin main
```

### 3. 文件修改范围约定

#### Kiro修改的文件
- `index.html` - 整体结构、样式、Tab功能
- `.kiro/` 目录下的所有文件
- 知识库相关HTML文件
- 文档类文件（.md）

#### 貔貅修改的文件
- `reports/` 目录下的简报文件
- `index.html` 中的 `REPORTS` 数组（仅添加新记录）

#### 共享文件（需要协调）
- `index.html` - 需要特别小心
  - Kiro: 修改结构、样式、Tab功能
  - 貔貅: 只在REPORTS数组开头添加新记录

## 🔄 同步检查清单

### 貔貅每日简报流程
```bash
# 1. 开始前先拉取最新代码
git pull origin main --rebase

# 2. 创建新简报文件
# reports/2026-04-XX.html

# 3. 更新index.html中的REPORTS数组
# 只在数组开头添加新记录，不修改其他部分

# 4. 提交前再次拉取
git pull origin main --rebase

# 5. 提交并推送
git add reports/2026-04-XX.html index.html
git commit -m "简报归档: 2026-04-XX"
git push origin main
```

### Kiro功能开发流程
```bash
# 1. 开始前先拉取最新代码
git pull origin main --rebase

# 2. 进行开发工作

# 3. 提交前再次拉取
git pull origin main --rebase

# 4. 提交并推送
git add .
git commit -m "功能描述"
git push origin main
```

## 📝 提交信息规范

### Kiro提交格式
```
feat: 添加XX功能
fix: 修复XX问题
docs: 更新XX文档
style: 优化XX样式
refactor: 重构XX模块
```

### 貔貅提交格式
```
简报归档: 2026-04-XX
```

## 🚨 冲突处理

### 如果发生冲突
1. **不要panic**
2. 查看冲突文件：`git status`
3. 手动解决冲突（保留双方的改动）
4. 标记为已解决：`git add <文件>`
5. 继续rebase：`git rebase --continue`
6. 推送：`git push origin main`

### 紧急情况联系
- 如果不确定如何处理，先不要推送
- 在聊天中通知对方
- 协商解决方案

## 📊 状态同步

### 工作状态文件
创建 `.kiro/WORK_STATUS.md` 记录当前工作状态：

```markdown
# 当前工作状态

## Kiro
- 状态: 空闲 / 开发中
- 正在修改: [文件列表]
- 预计完成: [时间]

## 貔貅
- 状态: 空闲 / 生成简报中
- 正在修改: [文件列表]
- 预计完成: [时间]
```

## 🔧 技术方案

### 方案1: 分支策略（推荐）
```bash
# Kiro使用 kiro-dev 分支
git checkout -b kiro-dev
# 开发完成后合并到main
git checkout main
git merge kiro-dev

# 貔貅使用 pixiu-daily 分支
git checkout -b pixiu-daily
# 简报完成后合并到main
git checkout main
git merge pixiu-daily
```

### 方案2: 文件锁定
在 `.kiro/FILE_LOCKS.json` 中记录文件锁定状态：
```json
{
  "index.html": {
    "locked_by": "kiro",
    "locked_at": "2026-04-27T20:00:00Z",
    "reason": "添加Tab功能"
  }
}
```

### 方案3: 自动同步检查
创建pre-push hook检查是否有未拉取的远程更新。

## 📅 定期同步

- 每天开始工作前：`git pull origin main --rebase`
- 每次推送前：`git pull origin main --rebase`
- 每周回顾：检查是否有未解决的冲突或问题

## 🎓 最佳实践

1. **小步提交**：频繁提交小的改动，而不是一次性大改动
2. **清晰的提交信息**：让对方知道你做了什么
3. **及时推送**：不要在本地积累太多未推送的提交
4. **沟通优先**：不确定时先沟通，再行动

---

**创建时间**: 2026-04-27  
**最后更新**: 2026-04-27  
**维护者**: Kiro & 貔貅

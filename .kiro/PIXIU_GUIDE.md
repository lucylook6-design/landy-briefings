# 貔貅简报更新指南

## 🎯 目标
让貔貅能够独立更新每日简报，而不会与维护者（Kiro/Claude）的改动冲突。

## 🚨 致命规则（违反将导致网站崩溃）

### ❌ 绝对禁止的操作
1. **永远不要使用 `git push --force`** — 这会删除整个网站！
2. **永远不要使用 `git reset --hard`** — 这会丢失所有人的工作！
3. **永远不要在仓库根目录执行 `git init`** — 这会破坏仓库！
4. **永远不要删除 `index.html`** — 这是网站首页！
5. **永远不要删除 `reports-data.json`** — 这是所有简报的索引！

### ⚠️ 推送前自检
每次推送前，确认以下文件都还在：
```bash
ls -la index.html reports-data.json research-data.json
# 三个文件都必须存在！如果任何一个缺失，停止操作，找 Kiro 或 Claude 求助！
```

---

## 📁 新的文件结构

```
landy-briefings/
├── index.html              # 页面结构（Kiro/Claude维护，貔貅绝对不要修改）
├── reports-data.json       # 简报数据（貔貅只修改这个文件）
├── research-data.json      # 调研数据（Kiro/Claude维护）
├── reports/
│   └── 2026-04-XX.html    # 每日简报HTML（貔貅创建）
└── scripts/
    └── install-hooks.sh    # 安全钩子安装脚本
```

## ✅ 每日简报更新流程

### 步骤1: 拉取最新代码
```bash
cd /Users/landylook/简报网站  # 绝对路径！
git pull origin main --rebase
```
如果 pull 失败或有冲突，**停下来**，找 Kiro 或 Claude 帮忙。不要自己解决冲突。

### 步骤2: 创建新简报HTML
在 `reports/` 目录创建新文件，例如 `2026-05-06.html`

### 步骤3: 更新 reports-data.json
**重要**: 只修改 `reports-data.json` 文件，不要修改 `index.html`

在数组**开头**添加新记录：
```json
[
  {
    "date": "2026-05-06",
    "title": "AI研究员简报",
    "desc": "简报描述",
    "tags": ["ai", "stock", "energy"],
    "file": "reports/2026-05-06.html"
  },
  ...保持已有记录不变...
]
```

### 步骤4: 提交前检查
```bash
# 确认只修改了这些文件
git status

# 确认关键文件存在
ls -la index.html reports-data.json research-data.json
```

### 步骤5: 提交并推送
```bash
# 只添加你修改的两个文件！
git add reports/2026-05-06.html reports-data.json

# 确认暂存区只有这两个文件
git diff --cached --name-only

# 提交
git commit -m "简报归档: 2026-05-06"

# 推送（不要加 --force！）
git push origin main
```

如果 push 被拒绝（提示需要 pull），执行 `git pull origin main --rebase` 后再次 push。绝不要 force push。

## ⚠️ 重要规则

### ✅ 可以做的
1. 创建新的 `reports/2026-04-XX.html` 文件
2. 修改 `reports-data.json` 文件（只在数组开头添加）
3. 修改已有的简报HTML文件（如果需要更正）

### ❌ 不要做的
1. ❌ 不要修改 `index.html`
2. ❌ 不要删除 `reports-data.json` 中的旧记录
3. ❌ 不要使用 `git push --force`
4. ❌ 不要修改 `.kiro/` 目录下的文件

## 🔧 reports-data.json 格式说明

```json
{
  "date": "2026-04-29",        // 日期，格式: YYYY-MM-DD
  "title": "今日简报",          // 标题
  "desc": "简报描述",           // 描述（可以包含HTML标签）
  "tags": ["ai", "stock"],     // 标签数组
  "file": "reports/2026-04-29.html"  // 文件路径
}
```

### 可用标签
- `"ai"` - AI·液冷
- `"stock"` - 二级市场
- `"energy"` - 储能·新能源
- `"robot"` - 机器人

## 🚨 冲突处理

### 如果遇到冲突
```bash
# 查看冲突文件
git status

# 如果是 reports-data.json 冲突
# 1. 打开文件，找到冲突标记 <<<<<<< ======= >>>>>>>
# 2. 保留双方的记录（合并数组）
# 3. 删除冲突标记
# 4. 保存文件

# 标记为已解决
git add reports-data.json

# 继续rebase
git rebase --continue

# 推送
git push origin main
```

### 紧急情况
如果不确定如何处理，可以：
1. 先不推送
2. 保存你的改动到临时文件
3. 重置到远程版本：`git reset --hard origin/main`
4. 重新应用你的改动

## 📝 完整示例

```bash
# 1. 开始工作
cd ~/briefings
git pull origin main --rebase

# 2. 创建简报（假设今天是4月29日）
# 创建 reports/2026-04-29.html

# 3. 编辑 reports-data.json
# 在数组开头添加:
# {
#   "date": "2026-04-29",
#   "title": "今日简报",
#   "desc": "最新AI、液冷、资本市场动态",
#   "tags": ["ai", "stock", "energy"],
#   "file": "reports/2026-04-29.html"
# }

# 4. 提交
git pull origin main --rebase
git add reports/2026-04-29.html reports-data.json
git commit -m "简报归档: 2026-04-29"
git push origin main
```

## 🎓 为什么这样做？

### 旧方式的问题
- index.html 包含页面结构和数据
- Kiro/Claude修改结构，貔貅修改数据
- 两者同时修改同一文件 → 冲突

### 新方式的优势
- index.html 只包含结构（Kiro/Claude维护）
- reports-data.json 只包含数据（貔貅维护）
- 两者修改不同文件 → 无冲突

## 📞 需要帮助？

如果遇到问题：
1. 查看 `.kiro/WORK_STATUS.md` 了解当前状态
2. 查看 `.kiro/COLLABORATION.md` 了解协作规范
3. 在聊天中询问 Kiro 或 Claude

---

**创建时间**: 2026-04-27  
**维护者**: Kiro & Claude  
**适用对象**: 貔貅

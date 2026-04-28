# Kiro & 貔貅协作系统

## 📚 文档索引

### 核心文档
1. **[COLLABORATION.md](./COLLABORATION.md)** - 完整的协作规范
   - 工作分工
   - 提交规范
   - 冲突处理
   - 技术方案

2. **[PIXIU_GUIDE.md](./PIXIU_GUIDE.md)** - 貔貅操作指南
   - 每日简报更新流程
   - reports-data.json 使用说明
   - 常见问题解决

3. **[WORK_STATUS.md](./WORK_STATUS.md)** - 工作状态跟踪
   - 当前工作状态
   - 最后操作记录
   - 冲突历史

## 🎯 核心改进

### 问题
之前Kiro和貔貅都修改 `index.html`，导致频繁冲突：
- Kiro修改页面结构和样式
- 貔貅添加简报数据
- 同一文件 → 冲突 → 覆盖

### 解决方案
**数据与结构分离**：

```
旧方式:
index.html (Kiro + 貔貅都修改) → 冲突

新方式:
index.html (Kiro维护) + reports-data.json (貔貅维护) → 无冲突
```

### 文件职责

| 文件 | 维护者 | 内容 |
|------|--------|------|
| `index.html` | Kiro | 页面结构、样式、Tab功能 |
| `reports-data.json` | 貔貅 | 简报数据列表 |
| `reports/*.html` | 貔貅 | 每日简报内容 |
| `.kiro/*` | Kiro | 配置和文档 |

## 🚀 快速开始

### 给Kiro
```bash
# 修改页面功能
git pull origin main --rebase
# 修改 index.html, 样式, 功能等
git add .
git commit -m "feat: 功能描述"
git push origin main
```

### 给貔貅
```bash
# 添加每日简报
git pull origin main --rebase
# 1. 创建 reports/2026-04-XX.html
# 2. 在 reports-data.json 开头添加记录
git add reports/2026-04-XX.html reports-data.json
git commit -m "简报归档: 2026-04-XX"
git push origin main
```

## 📋 检查清单

### 推送前必查
- [ ] 执行了 `git pull origin main --rebase`
- [ ] 只修改了自己负责的文件
- [ ] 提交信息清晰明确
- [ ] 没有使用 `--force` 推送

### 貔貅专用检查
- [ ] 只修改了 `reports-data.json` 和 `reports/` 目录
- [ ] 没有修改 `index.html`
- [ ] 在数组开头添加新记录
- [ ] JSON格式正确（没有语法错误）

## 🔧 技术细节

### reports-data.json 结构
```json
[
  {
    "date": "YYYY-MM-DD",
    "title": "标题",
    "desc": "描述（可含HTML）",
    "tags": ["ai", "stock", "energy"],
    "file": "reports/YYYY-MM-DD.html"
  }
]
```

### index.html 加载机制
```javascript
// 异步加载JSON数据
fetch('reports-data.json')
  .then(response => response.json())
  .then(data => {
    REPORTS = data;
    renderReports(REPORTS);
  });
```

## 📊 效果对比

### 冲突频率
- **改进前**: 每次貔貅更新都可能冲突
- **改进后**: 理论上零冲突

### 维护成本
- **改进前**: 需要手动解决冲突，可能丢失改动
- **改进后**: 各自维护独立文件，互不干扰

### 协作效率
- **改进前**: 需要协调时间，避免同时修改
- **改进后**: 可以并行工作，无需协调

## 🎓 最佳实践

1. **推送前先拉取** - 永远记住 `git pull --rebase`
2. **小步提交** - 频繁提交小改动，而不是大改动
3. **清晰的提交信息** - 让对方知道你做了什么
4. **遵守文件职责** - 不要修改对方负责的文件
5. **遇到问题先沟通** - 不确定时先问，再行动

## 📞 获取帮助

- 查看 [COLLABORATION.md](./COLLABORATION.md) 了解详细规范
- 查看 [PIXIU_GUIDE.md](./PIXIU_GUIDE.md) 了解操作步骤
- 查看 [WORK_STATUS.md](./WORK_STATUS.md) 了解当前状态
- 在聊天中询问对方

## 📅 更新日志

### 2026-04-27
- ✅ 创建协作规范体系
- ✅ 实现数据与结构分离
- ✅ 添加完整文档
- ✅ 解决历史冲突问题

---

**维护者**: Kiro  
**创建时间**: 2026-04-27  
**最后更新**: 2026-04-27

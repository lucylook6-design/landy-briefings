# HR智能体 — AI驱动简历筛选系统

## 📋 项目概述

HR智能体是一款面向猎头顾问和RPO机构的AI驱动简历筛选工具，旨在解决招聘流程中匹配精度低、简历筛选重复低效、JD撰写不规范等核心痛点。

### 核心价值

- 🚀 **效率提升**: 将200份简历筛选时间从半天压缩至5分钟
- 💰 **成本优化**: token消耗降至全流程大模型方案的1/50
- 🎯 **精准匹配**: 三层漏斗架构（结构化切片 + embedding语义初筛 + 大模型精筛）
- 🔒 **数据安全**: AES-256加密存储，数据库行级安全策略（RLS）

---

## 🎯 MVP v1.0 功能

### 核心功能
- ✅ 多格式简历解析（Word/PDF）
- ✅ JD语义匹配评分（embedding初筛）
- ✅ 大模型二次精筛 + 推荐理由
- ✅ PC端基础UI与交互
- ✅ AI辅助优化JD
- ✅ 企业微信自动交付
- ✅ 多客户多需求管理

### 🆕 新增功能（v1.1）
- ✨ **用户-公司权限管理**: 一个用户可管理多个公司，支持公司切换
- ✨ **BOSS直聘账号绑定**: 每个公司可配置BOSS直聘账号，自动获取简历

---

## 📁 项目结构

```
.
├── .kiro/
│   └── specs/
│       └── ai-resume-screening/          # 需求规格文档
│           ├── discovery.md              # 需求发现
│           ├── sort.md                   # 价值排序
│           ├── requirements.md           # 需求分析
│           ├── clarification.md          # 需求澄清
│           ├── validation.md             # 需求验证
│           ├── prd.md                    # 产品需求文档
│           ├── mvp-features.md           # MVP功能需求表
│           ├── project-plan.md           # 项目管理表
│           ├── data-model.md             # 数据模型
│           ├── rtm.md                    # 需求追溯矩阵
│           ├── UPDATE_SUMMARY.md         # 更新总结
│           └── prototype/                # 交互原型
│               ├── index.html            # 导航首页
│               ├── README.md             # 原型说明
│               ├── CHANGELOG.md          # 更新日志
│               ├── css/                  # 样式文件
│               └── pages/                # 功能页面
│                   ├── dashboard.html
│                   ├── job-detail.html
│                   ├── resume-upload.html
│                   ├── screening-result.html
│                   ├── delivery.html
│                   └── company-settings.html  # 🆕 公司管理
└── README.md                             # 本文档
```

---

## 🎨 交互原型

### 在线访问

原型文件位于 `.kiro/specs/ai-resume-screening/prototype/` 目录。

### 本地访问

```bash
# 克隆仓库后，直接在浏览器中打开
open .kiro/specs/ai-resume-screening/prototype/index.html
```

### 推荐浏览顺序

1. **主导航页** (`index.html`) - 了解整体结构
2. **公司管理** (`pages/company-settings.html`) - 🆕 权限管理和账号绑定
3. **需求看板** (`pages/dashboard.html`) - 体验公司切换功能
4. **完整流程** - 按业务流程浏览其他页面

---

## 📊 项目进度

### MVP v1.0
- **状态**: 需求分析完成，原型已更新
- **工期**: 6周
- **工作量**: 64人天
- **团队**: 4人（前端1人、后端1人、AI/算法1人、测试1人）

### 里程碑

| 里程碑 | 目标日期 | 状态 |
|--------|----------|------|
| 需求分析完成 | ✅ 已完成 | 完成 |
| 原型设计完成 | ✅ 已完成 | 完成 |
| MVP v1.0 开发 | 6周后 | 待开始 |
| v1.1 发布 | MVP后5周 | 规划中 |
| v2.0 发布 | v1.1后9周 | 规划中 |

---

## 🛠️ 技术栈（规划）

### 前端
- React / Vue.js
- Ant Design / Element Plus
- Redux / Vuex

### 后端
- Node.js / Python
- PostgreSQL（支持RLS）
- Redis

### AI/算法
- Embedding服务（向量化）
- 大模型API（精筛）
- 简历解析（Apache Tika / PyMuPDF）

### 安全
- AES-256 加密（密码存储）
- TLS 1.3（数据传输）
- 数据库行级安全策略（RLS）

---

## 📝 需求文档

### 核心文档
- [产品需求文档 (PRD)](.kiro/specs/ai-resume-screening/prd.md)
- [MVP功能需求表](.kiro/specs/ai-resume-screening/mvp-features.md)
- [项目管理表](.kiro/specs/ai-resume-screening/project-plan.md)
- [需求分析](.kiro/specs/ai-resume-screening/requirements.md)
- [数据模型](.kiro/specs/ai-resume-screening/data-model.md)

### 原型文档
- [原型使用说明](.kiro/specs/ai-resume-screening/prototype/README.md)
- [原型更新日志](.kiro/specs/ai-resume-screening/prototype/CHANGELOG.md)
- [更新总结](.kiro/specs/ai-resume-screening/UPDATE_SUMMARY.md)

---

## 🎯 成功标准

| 指标 | 目标值 | 测量方式 |
|------|--------|----------|
| 200份简历筛选耗时 | <5分钟 | 系统日志统计 |
| 猎头对推荐结果满意度 | ≥70% | 用户反馈问卷 |
| token消耗 vs 全流程大模型 | ≤1/50 | 监控统计 |
| 企业微信推送成功率 | ≥99% | 监控告警 |
| 简历解析字段完整率 | ≥95% | 测试用例验证 |
| 系统月可用性SLA | ≥99.5% | 监控统计 |

---

## 🔐 安全与合规

### 数据安全
- 账号密码 AES-256 加密存储
- 数据传输 TLS 1.3 加密
- 数据库行级安全策略（RLS）

### 隐私保护
- 简历数据默认保留1年
- 到期前30天提醒
- 到期后自动脱敏归档

### 合规要求
- 符合《个人信息保护法》
- 候选人数据授权机制
- 法务审查流程

---

## 📞 联系方式

- **项目负责人**: [待填写]
- **产品团队**: [待填写]
- **技术团队**: [待填写]

---

## 📄 许可证

[待定]

---

**最后更新**: 2026-04-23  
**版本**: v1.1  
**状态**: 需求分析阶段

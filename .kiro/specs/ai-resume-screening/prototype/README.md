# HR智能体 - 交互原型说明

## 📋 概述

这是 HR智能体（AI驱动简历筛选系统）的静态HTML交互原型，用于演示 MVP v1.0 的核心功能和交互流程。

**版本**: v1.1  
**更新日期**: 2026-04-23  
**状态**: 静态原型（仅供演示）

---

## 🚀 快速开始

### 访问方式

1. 直接在浏览器中打开 `index.html`
2. 从导航页面选择要查看的功能模块

### 推荐浏览顺序

```
index.html (导航页)
  ↓
pages/company-settings.html (公司管理 - 新增)
  ↓
pages/dashboard.html (需求看板)
  ↓
pages/job-detail.html (JD详情)
  ↓
pages/resume-upload.html (简历上传)
  ↓
pages/screening-result.html (筛选结果)
  ↓
pages/delivery.html (企业微信交付)
```

---

## 📁 文件结构

```
prototype/
├── index.html                    # 导航首页
├── css/
│   └── style.css                # 全局样式
├── pages/
│   ├── dashboard.html           # 需求管理看板
│   ├── job-detail.html          # 招聘需求详情
│   ├── resume-upload.html       # 简历上传与解析
│   ├── resume-detail.html       # 简历详情页
│   ├── screening-result.html    # 筛选结果
│   ├── delivery.html            # 企业微信交付
│   └── company-settings.html    # 公司管理 (NEW)
├── CHANGELOG.md                 # 更新日志
└── README.md                    # 本文档
```

---

## ✨ 功能模块

### 1. 公司管理与平台账号配置 🆕

**页面**: `pages/company-settings.html`  
**用户故事**: US-015, US-016, US-019

#### 核心功能
- ✅ 用户可以管理多个公司
- ✅ 支持公司切换（顶栏下拉选择）
- ✅ 为每个公司配置BOSS直聘账号
- ✅ 账号密码加密存储（AES-256）
- ✅ 测试账号连接状态
- ✅ 显示用户在公司的角色（管理员/成员）

#### 交互演示
1. **添加公司**: 点击"添加公司"按钮，填写公司信息
2. **绑定账号**: 在未绑定的公司卡片中点击"立即绑定"
3. **修改账号**: 在已绑定的公司卡片中点击"修改账号"
4. **测试连接**: 点击"测试连接"按钮验证账号可用性

#### 数据隔离
- 所有招聘需求、简历、筛选任务按公司隔离
- 切换公司后，数据自动过滤

---

### 2. 需求管理看板

**页面**: `pages/dashboard.html`  
**用户故事**: US-001, US-014

#### 核心功能
- 多客户招聘需求列表
- 按客户、状态筛选
- 查看进度和当前阶段
- 统计数据展示

#### 新增功能 🆕
- 顶栏公司切换器（下拉选择）
- 侧边栏"公司管理"导航链接

---

### 3. 招聘需求详情

**页面**: `pages/job-detail.html`  
**用户故事**: US-001, US-002

#### 核心功能
- JD创建与编辑
- AI辅助优化JD
- 配置筛选参数（初筛保留数量）

---

### 4. 简历上传与解析

**页面**: `pages/resume-upload.html`  
**用户故事**: US-004, US-008

#### 核心功能
- 批量拖拽上传简历
- 解析进度展示
- 结构化结果预览
- OCR重试机制

---

### 5. 筛选结果

**页面**: `pages/screening-result.html`  
**用户故事**: US-009, US-010

#### 核心功能
- 语义初筛（embedding匹配）
- 大模型精筛排序
- 结构化推荐理由（优势、匹配点、潜在风险）
- 候选人详情查看

---

### 6. 企业微信交付

**页面**: `pages/delivery.html`  
**用户故事**: US-012

#### 核心功能
- 确认推送内容
- 发送结构化消息卡片
- 附带简历PDF
- 交付记录查看

---

## 🎨 设计规范

### 颜色系统
- **主色**: `#3b82f6` (蓝色)
- **成功**: `#10b981` (绿色)
- **警告**: `#f59e0b` (橙色)
- **危险**: `#ef4444` (红色)
- **灰度**: `#f9fafb` ~ `#111827`

### 组件库
- 按钮: `.btn`, `.btn-primary`, `.btn-secondary`, `.btn-success`
- 卡片: `.card`, `.card-header`, `.card-body`
- 表单: `.form-control`, `.form-label`, `.form-group`
- 徽章: `.badge`, `.badge-blue`, `.badge-green`, `.badge-yellow`
- 模态框: `.modal`, `.modal-content`, `.modal-header`, `.modal-body`

---

## 🔒 安全特性演示

### 密码加密存储
- BOSS直聘账号密码显示为 `••••••••••••`
- 仅授权管理员可以修改
- 使用 AES-256 加密算法（实际实现）

### 数据隔离
- 数据库行级安全策略（RLS）
- 用户只能访问有权限的公司数据
- 切换公司后自动过滤数据

---

## 📊 MVP 范围

### 包含功能（P0）
- ✅ 多格式简历解析（Word/PDF）
- ✅ JD语义匹配评分（embedding初筛）
- ✅ 大模型二次精筛 + 推荐理由
- ✅ PC端基础UI与交互
- ✅ AI辅助优化JD
- ✅ 企业微信自动交付
- ✅ 多客户多需求管理
- ✅ **用户-公司权限管理** (NEW)
- ✅ **BOSS直聘账号绑定** (NEW)

### 暂不包含（v1.1+）
- ❌ 从简历反向生成JD
- ❌ 多平台API对接（猎聘、拉钩等）
- ❌ 多账号轮换管理
- ❌ AI浏览器获取简历
- ❌ 定时自动筛选

---

## 🛠️ 技术说明

### 原型限制
- 静态HTML，无后端交互
- 数据为模拟数据
- 部分交互使用 `alert()` 模拟
- 不包含真实的API调用

### 实际实现要点
1. **前端框架**: 建议使用 React/Vue
2. **状态管理**: Redux/Vuex
3. **UI组件库**: Ant Design/Element Plus
4. **后端API**: RESTful API
5. **数据库**: PostgreSQL（支持RLS）
6. **加密**: AES-256（密码存储）

---

## 📝 需求追溯

| 页面 | 用户故事 | 需求ID | 优先级 |
|------|---------|--------|--------|
| company-settings.html | US-015, US-016, US-019 | REQ-007-1, REQ-007-2 | P0 |
| dashboard.html | US-001, US-014 | REQ-010 | P0 |
| job-detail.html | US-001, US-002 | REQ-011 | P0 |
| resume-upload.html | US-004, US-008 | REQ-001 | P0 |
| screening-result.html | US-009, US-010 | REQ-002, REQ-003 | P0 |
| delivery.html | US-012 | REQ-009 | P0 |

---

## 📞 反馈与建议

如有任何问题或建议，请联系产品团队。

---

**最后更新**: 2026-04-23  
**维护者**: 产品团队

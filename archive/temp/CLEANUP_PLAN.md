# 📁 文件整理方案

## 当前问题
1. ✅ 根目录文件过多（49个文件/文件夹）
2. ✅ 备份文件混杂（.bak, .backup-*）
3. ✅ 重复的HTML版本（3个UDQ手册版本）
4. ✅ 文档分散（中英文混杂）
5. ✅ 脚本和文档未分类

## 新的目录结构

```
briefings/
├── index.html                          # 【保留】主页
├── reports-data.json                   # 【保留】简报数据
├── README.md                           # 【保留】项目说明
├── .gitignore                          # 【保留】
├── .git/                               # 【保留】
├── .kiro/                              # 【保留】
│
├── reports/                            # 【保留】每日简报
│   ├── 2026-04-30.html
│   └── ...
│
├── docs/                               # 【新建】文档中心
│   ├── guides/                         # 使用指南
│   │   ├── 每日简报访问链接.md
│   │   ├── UDQ执行手册-使用说明.md
│   │   ├── 发布前检查清单.md
│   │   ├── 预览说明.md
│   │   └── 给貔貅的协作指南.md
│   │
│   ├── versions/                       # 版本说明
│   │   ├── v2版本发布说明.md
│   │   ├── v2.1版本更新说明.md
│   │   ├── 问题解决总结.md
│   │   ├── 文件名已更新说明.md
│   │   └── DeepSeek内容整合说明.md
│   │
│   ├── technical/                      # 技术文档
│   │   ├── liquid-cooling-training-返回按钮指南.md
│   │   ├── PDF生成指南.md
│   │   └── openclaw-status.md
│   │
│   └── requirements/                   # 需求文档
│       └── 需求文案.md
│
├── handbooks/                          # 【新建】手册中心
│   ├── udq-factory-90day-handbook-v2-full.html  # 【保留】当前版本
│   └── legacy/                         # 历史版本
│       ├── udq-factory-90day-handbook-v2.html
│       └── udq-factory-90day-handbook.html
│
├── products/                           # 【新建】产品资料
│   ├── cejn-product-inventory.html     # 重命名
│   ├── 综合产品库存表格.csv
│   ├── 综合产品库存文档.html
│   ├── 综合产品库存文档.md
│   ├── pdfs/                           # PDF文件
│   │   ├── UDQ液冷接头投产执行路径_Landy+Claude.pdf
│   │   ├── 产品图册.pdf
│   │   └── 产品库存列表.pdf
│   └── extracted/                      # PDF提取的文本
│       ├── 产品图册.txt
│       └── 产品库存列表.txt
│
├── scripts/                            # 【新建】脚本工具
│   ├── autopush.sh                     # 【移动】自动推送
│   ├── archive.sh                      # 【移动】归档脚本
│   ├── update-index.sh                 # 【移动】更新索引
│   ├── fix-deepseek-reasoning.sh       # 【移动】修复脚本
│   ├── fix-index-encoding.sh           # 【移动】编码修复
│   ├── extract_pdf.py                  # 【移动】PDF提取
│   └── update_product_links.py         # 【移动】更新链接
│
├── assets/                             # 【新建】资源文件
│   └── qrcode.png
│
├── logs/                               # 【新建】日志文件
│   └── autopush.log
│
└── archive/                            # 【新建】归档备份
    ├── backups/                        # 备份文件
    │   ├── index.html.backup-20260424-113330
    │   ├── index.html.bak
    │   ├── archive.sh.bak
    │   └── reports-data.json.bak
    └── temp/                           # 临时文件
        ├── .!17321!index.html
        └── UDQ液冷接头投产执行路径_Landy+Claude.md

```

## 关键决策

### ✅ 保留在根目录
- `index.html` - 主页（GitHub Pages需要）
- `reports-data.json` - 数据文件（主页引用）
- `README.md` - 项目说明
- `reports/` - 简报目录（主页引用）
- `udq-factory-90day-handbook-v2-full.html` - 移到 handbooks/

### 📦 需要移动的文件
- 所有 `.md` 文档 → `docs/` 分类存放
- 所有脚本 → `scripts/`
- 所有备份文件 → `archive/backups/`
- 产品相关 → `products/`
- 旧版本手册 → `handbooks/legacy/`

### 🗑️ 可以删除的文件（需确认）
- `.!17321!index.html` - 临时文件
- `UDQ液冷接头投产执行路径_Landy+Claude.md` - 已有PDF版本

## 执行步骤

1. **创建新目录结构**
2. **移动文件到对应目录**
3. **更新引用路径**（如果有）
4. **测试网站功能**
5. **提交Git**

## 需要更新的引用

### index.html
- 检查是否引用了 `udq-factory-90day-handbook-v2-full.html`
- 如果有，需要更新为 `handbooks/udq-factory-90day-handbook-v2-full.html`

### 脚本文件
- `autopush.sh` - 可能需要更新路径
- `update-index.sh` - 可能需要更新路径

## 安全措施

1. ✅ 所有文件都移动，不删除
2. ✅ 备份文件归档到 `archive/`
3. ✅ 执行前先提交当前状态到Git
4. ✅ 执行后测试网站功能
5. ✅ 如有问题可以回滚


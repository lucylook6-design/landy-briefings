#!/bin/bash
# 文件整理脚本 - 安全版本
# 执行前会先提交当前状态到Git

set -e  # 遇到错误立即停止

echo "🚀 开始整理文件..."
echo ""

# 1. 先提交当前状态（安全措施）
echo "📦 步骤1: 提交当前状态到Git（安全备份）..."
git add -A
git commit -m "整理前备份: $(date '+%Y-%m-%d %H:%M:%S')" || echo "没有需要提交的更改"
echo "✅ 当前状态已保存"
echo ""

# 2. 创建新目录结构
echo "📁 步骤2: 创建新目录结构..."
mkdir -p docs/guides
mkdir -p docs/versions
mkdir -p docs/technical
mkdir -p docs/requirements
mkdir -p handbooks/legacy
mkdir -p products/pdfs
mkdir -p products/extracted
mkdir -p scripts
mkdir -p assets
mkdir -p logs
mkdir -p archive/backups
mkdir -p archive/temp
echo "✅ 目录结构创建完成"
echo ""

# 3. 移动文档文件
echo "📄 步骤3: 整理文档..."
mv "每日简报访问链接.md" docs/guides/ 2>/dev/null || true
mv "UDQ执行手册-使用说明.md" docs/guides/ 2>/dev/null || true
mv "发布前检查清单.md" docs/guides/ 2>/dev/null || true
mv "预览说明.md" docs/guides/ 2>/dev/null || true
mv "给貔貅的协作指南.md" docs/guides/ 2>/dev/null || true

mv "v2版本发布说明.md" docs/versions/ 2>/dev/null || true
mv "v2.1版本更新说明.md" docs/versions/ 2>/dev/null || true
mv "问题解决总结.md" docs/versions/ 2>/dev/null || true
mv "文件名已更新说明.md" docs/versions/ 2>/dev/null || true
mv "DeepSeek内容整合说明.md" docs/versions/ 2>/dev/null || true

mv "liquid-cooling-training-返回按钮指南.md" docs/technical/ 2>/dev/null || true
mv "PDF生成指南.md" docs/technical/ 2>/dev/null || true
mv "openclaw-status.md" docs/technical/ 2>/dev/null || true

mv "需求文案.md" docs/requirements/ 2>/dev/null || true
echo "✅ 文档整理完成"
echo ""

# 4. 移动手册文件
echo "📚 步骤4: 整理手册..."
mv "udq-factory-90day-handbook-v2-full.html" handbooks/ 2>/dev/null || true
mv "udq-factory-90day-handbook-v2.html" handbooks/legacy/ 2>/dev/null || true
mv "udq-factory-90day-handbook.html" handbooks/legacy/ 2>/dev/null || true
echo "✅ 手册整理完成"
echo ""

# 5. 移动产品资料
echo "🔧 步骤5: 整理产品资料..."
mv "综合产品库存表格.csv" products/ 2>/dev/null || true
mv "综合产品库存文档.html" products/ 2>/dev/null || true
mv "综合产品库存文档.md" products/ 2>/dev/null || true

mv "UDQ液冷接头投产执行路径_Landy+Claude.pdf" products/pdfs/ 2>/dev/null || true
mv "产品图册.pdf" products/pdfs/ 2>/dev/null || true
mv "产品库存列表.pdf" products/pdfs/ 2>/dev/null || true

mv "产品图册.txt" products/extracted/ 2>/dev/null || true
mv "产品库存列表.txt" products/extracted/ 2>/dev/null || true
echo "✅ 产品资料整理完成"
echo ""

# 6. 移动脚本文件
echo "⚙️  步骤6: 整理脚本..."
mv "autopush.sh" scripts/ 2>/dev/null || true
mv "archive.sh" scripts/ 2>/dev/null || true
mv "update-index.sh" scripts/ 2>/dev/null || true
mv "fix-deepseek-reasoning.sh" scripts/ 2>/dev/null || true
mv "fix-index-encoding.sh" scripts/ 2>/dev/null || true
mv "extract_pdf.py" scripts/ 2>/dev/null || true
mv "update_product_links.py" scripts/ 2>/dev/null || true
echo "✅ 脚本整理完成"
echo ""

# 7. 移动资源和日志
echo "🎨 步骤7: 整理资源和日志..."
mv "qrcode.png" assets/ 2>/dev/null || true
mv "autopush.log" logs/ 2>/dev/null || true
echo "✅ 资源和日志整理完成"
echo ""

# 8. 归档备份文件
echo "📦 步骤8: 归档备份文件..."
mv "index.html.backup-20260424-113330" archive/backups/ 2>/dev/null || true
mv "index.html.bak" archive/backups/ 2>/dev/null || true
mv "archive.sh.bak" archive/backups/ 2>/dev/null || true
mv "reports-data.json.bak" archive/backups/ 2>/dev/null || true
echo "✅ 备份文件归档完成"
echo ""

# 9. 归档临时文件
echo "🗑️  步骤9: 归档临时文件..."
mv ".!17321!index.html" archive/temp/ 2>/dev/null || true
mv "UDQ液冷接头投产执行路径_Landy+Claude.md" archive/temp/ 2>/dev/null || true
echo "✅ 临时文件归档完成"
echo ""

echo "🎉 文件整理完成！"
echo ""
echo "📋 下一步操作："
echo "1. 运行测试脚本: ./test-after-cleanup.sh"
echo "2. 检查网站是否正常: open index.html"
echo "3. 如果一切正常，提交更改: git add -A && git commit -m '整理文件结构'"
echo "4. 如果有问题，回滚: git reset --hard HEAD^"
echo ""

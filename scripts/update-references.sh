#!/bin/bash
# 更新文件引用路径

echo "🔧 更新文件引用..."

# 备份 index.html
cp index.html index.html.pre-update-backup

# 更新 index.html 中的引用
sed -i '' 's|href="udq-factory-90day-handbook-v2-full.html"|href="handbooks/udq-factory-90day-handbook-v2-full.html"|g' index.html

echo "✅ index.html 引用已更新"
echo "   udq-factory-90day-handbook-v2-full.html → handbooks/udq-factory-90day-handbook-v2-full.html"
echo ""
echo "📝 备份文件: index.html.pre-update-backup"
echo ""

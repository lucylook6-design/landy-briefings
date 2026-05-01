#!/bin/bash
# 整理后测试脚本

echo "🧪 开始测试..."
echo ""

# 测试关键文件是否存在
echo "📋 检查关键文件..."

files_to_check=(
  "index.html"
  "reports-data.json"
  "README.md"
  "handbooks/udq-factory-90day-handbook-v2-full.html"
  "reports/cejn-product-inventory.html"
  "scripts/autopush.sh"
  "docs/guides/每日简报访问链接.md"
)

all_good=true

for file in "${files_to_check[@]}"; do
  if [ -f "$file" ]; then
    echo "✅ $file"
  else
    echo "❌ $file - 文件不存在！"
    all_good=false
  fi
done

echo ""

# 检查目录结构
echo "📁 检查目录结构..."
dirs_to_check=(
  "docs/guides"
  "docs/versions"
  "docs/technical"
  "handbooks"
  "products"
  "scripts"
  "archive/backups"
)

for dir in "${dirs_to_check[@]}"; do
  if [ -d "$dir" ]; then
    echo "✅ $dir/"
  else
    echo "❌ $dir/ - 目录不存在！"
    all_good=false
  fi
done

echo ""

# 检查引用是否正确
echo "🔗 检查文件引用..."
if grep -q 'href="handbooks/udq-factory-90day-handbook-v2-full.html"' index.html; then
  echo "✅ index.html 中的 UDQ 手册引用正确"
else
  echo "⚠️  index.html 中的 UDQ 手册引用可能需要更新"
  all_good=false
fi

echo ""

# 统计文件数量
echo "📊 文件统计..."
echo "根目录文件数: $(ls -1 | wc -l | tr -d ' ')"
echo "docs/ 文件数: $(find docs -type f | wc -l | tr -d ' ')"
echo "handbooks/ 文件数: $(find handbooks -type f | wc -l | tr -d ' ')"
echo "products/ 文件数: $(find products -type f | wc -l | tr -d ' ')"
echo "scripts/ 文件数: $(find scripts -type f | wc -l | tr -d ' ')"
echo "archive/ 文件数: $(find archive -type f | wc -l | tr -d ' ')"

echo ""

if [ "$all_good" = true ]; then
  echo "🎉 所有测试通过！"
  echo ""
  echo "📋 建议下一步："
  echo "1. 在浏览器中打开 index.html 测试网站"
  echo "2. 点击知识库中的 UDQ 手册链接，确认能正常打开"
  echo "3. 如果一切正常，提交更改:"
  echo "   git add -A"
  echo "   git commit -m '整理文件结构: 分类存放文档、脚本、产品资料'"
  echo "   git push origin main"
else
  echo "⚠️  发现问题，请检查上述错误"
  echo ""
  echo "如需回滚，运行: git reset --hard HEAD^"
fi

echo ""

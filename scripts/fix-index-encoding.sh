#!/bin/bash
# 修复 index.html 编码问题并添加新简报

BRIEFINGS=~/briefings
INDEX="$BRIEFINGS/index.html"

echo "🔧 修复编码并更新索引..."

# 先转换编码
iconv -f ISO-8859-1 -t UTF-8 "$INDEX" > "$INDEX.utf8" 2>/dev/null || cp "$INDEX" "$INDEX.utf8"

# 使用 sed 添加新条目（一次一个，避免复杂的多行处理）
# 添加 4月24日
if ! grep -q '"2026-04-24"' "$INDEX.utf8"; then
  cat > /tmp/entry-24.txt << 'EOF'
  {
    date: "2026-04-24",
    title: "AI研究员--Landy葉的简报",
    desc: "DeepSeek发布V4接口文档 · 霍尔木兹海峡局势升温 · 德州仪器Q2大超预期",
    tags: ["ai", "stock", "energy"],
    file: "reports/2026-04-24.html"
  },
EOF
  
  # 在 REPORTS 数组开头插入
  awk '/const REPORTS = \[/{print; system("cat /tmp/entry-24.txt"); next}1' "$INDEX.utf8" > "$INDEX.tmp"
  mv "$INDEX.tmp" "$INDEX.utf8"
  echo "✅ 已添加 2026-04-24"
fi

# 添加 4月23日
if ! grep -q '"2026-04-23"' "$INDEX.utf8"; then
  cat > /tmp/entry-23.txt << 'EOF'
  {
    date: "2026-04-23",
    title: "AI研究员--Landy葉的简报",
    desc: "AI算力需求持续增长 · 液冷技术加速普及 · 新能源市场动态",
    tags: ["ai", "stock", "energy"],
    file: "reports/2026-04-23.html"
  },
EOF
  
  awk '/const REPORTS = \[/{print; system("cat /tmp/entry-23.txt"); next}1' "$INDEX.utf8" > "$INDEX.tmp"
  mv "$INDEX.tmp" "$INDEX.utf8"
  echo "✅ 已添加 2026-04-23"
fi

# 替换原文件
mv "$INDEX.utf8" "$INDEX"

# 清理临时文件
rm -f /tmp/entry-23.txt /tmp/entry-24.txt

# Git 提交
cd "$BRIEFINGS"
git add index.html
git commit -m "更新索引: 添加 4月23-24日简报" && \
  git push origin main && \
  echo "🚀 已推送到 GitHub Pages" || \
  echo "⚠️  推送失败"

echo ""
echo "🌐 在线网站: https://lucylook6-design.github.io/landy-briefings/"

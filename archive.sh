#!/bin/bash
# 自动归档 openclaw 生成的日报到网站

WORKSPACE=~/.openclaw/workspace
BRIEFINGS=~/briefings
REPORTS=$BRIEFINGS/reports

# 查找最新的 HTML 简报
LATEST=$(ls -t $WORKSPACE/*report*.html $WORKSPACE/lt_report*.html 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
  echo "❌ 未找到新简报"
  exit 1
fi

# 提取日期（从文件名或内容）
FILENAME=$(basename "$LATEST")
DATE=$(echo "$FILENAME" | grep -oE '[0-9]{8}' | head -1)

if [ -z "$DATE" ]; then
  echo "⚠️  无法从文件名提取日期，使用今天日期"
  DATE=$(date +%Y%m%d)
fi

# 格式化日期 YYYYMMDD -> YYYY-MM-DD
FORMATTED_DATE="${DATE:0:4}-${DATE:4:2}-${DATE:6:2}"
TARGET="$REPORTS/$FORMATTED_DATE.html"

# 复制文件
cp "$LATEST" "$TARGET"
echo "✅ 已归档: $TARGET"

# 更新 index.html 中的 REPORTS 数组
# 提取简报标题和描述（从 HTML 中）
TITLE=$(grep -oP '<h1[^>]*>\K[^<]+' "$TARGET" | head -1 | sed 's/AI研究员--Landy陸葉的简报//' | xargs)
if [ -z "$TITLE" ]; then
  TITLE="每日简报"
fi

DESC=$(grep -oP '<li><strong>\K[^<]+' "$TARGET" | head -3 | paste -sd ' · ' -)
if [ -z "$DESC" ]; then
  DESC="液冷 · AI · 资本市场情报"
fi

# 生成新的 REPORTS 条目
NEW_ENTRY=$(cat <<ENTRY
  {
    date: "$FORMATTED_DATE",
    title: "$TITLE",
    desc: "$DESC",
    tags: ["ai", "stock", "energy"],
    file: "reports/$FORMATTED_DATE.html"
  }
ENTRY
)

# 插入到 index.html（在 REPORTS 数组开头）
sed -i.bak "/const REPORTS = \[/a\\
$NEW_ENTRY," "$BRIEFINGS/index.html"

echo "✅ 已更新首页索引"
echo ""
echo "🌐 打开网站: file://$BRIEFINGS/index.html"

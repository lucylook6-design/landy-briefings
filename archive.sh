#!/bin/bash
# 自动归档 openclaw 生成的日报到网站并推送 GitHub Pages

WORKSPACE=~/.openclaw/workspace
BRIEFINGS=~/briefings
REPORTS=$BRIEFINGS/reports

# 动态读取系统代理端口
PROXY_PORT=$(scutil --proxy 2>/dev/null | grep HTTPSPort | awk '{print $3}')
if [ -n "$PROXY_PORT" ]; then
  export https_proxy=http://127.0.0.1:$PROXY_PORT
  export http_proxy=http://127.0.0.1:$PROXY_PORT
fi

# 查找最新的 HTML 简报
LATEST=$(ls -t $WORKSPACE/lt_report_*.html $WORKSPACE/*report*.html 2>/dev/null | head -1)

if [ -z "$LATEST" ]; then
  echo "❌ 未找到新简报"
  exit 1
fi

# 提取日期
FILENAME=$(basename "$LATEST")
DATE=$(echo "$FILENAME" | grep -oE '[0-9]{8}' | head -1)
if [ -z "$DATE" ]; then
  DATE=$(date +%Y%m%d)
fi
FORMATTED_DATE="${DATE:0:4}-${DATE:4:2}-${DATE:6:2}"
TARGET="$REPORTS/$FORMATTED_DATE.html"

# 复制文件
cp "$LATEST" "$TARGET"
echo "✅ 已归档: $TARGET"

# 提取标题和描述
TITLE=$(grep -oE '<h1[^>]*>[^<]+' "$TARGET" | sed 's/<[^>]*>//' | head -1 | xargs)
DESC=$(grep -oE '<li><strong>[^<]+' "$TARGET" | sed 's/<[^>]*>//' | head -3 | paste -sd ' · ' -)
[ -z "$TITLE" ] && TITLE="每日简报"
[ -z "$DESC" ] && DESC="液冷 · AI · 资本市场情报"

# 更新 index.html REPORTS 数组（去重后插入）
if ! grep -q "\"$FORMATTED_DATE\"" "$BRIEFINGS/index.html"; then
  NEW_ENTRY="  {\n    date: \"$FORMATTED_DATE\",\n    title: \"$TITLE\",\n    desc: \"$DESC\",\n    tags: [\"ai\", \"stock\", \"energy\"],\n    file: \"reports/$FORMATTED_DATE.html\"\n  },"
  sed -i.bak "s|const REPORTS = \[|const REPORTS = [\n$NEW_ENTRY|" "$BRIEFINGS/index.html"
  echo "✅ 已更新首页索引"
else
  echo "ℹ️  $FORMATTED_DATE 已存在，跳过索引更新"
fi

# Git 提交并推送
git -C "$BRIEFINGS" add .
if git -C "$BRIEFINGS" diff --cached --quiet; then
  echo "ℹ️  无新变更，无需推送"
else
  git -C "$BRIEFINGS" commit -m "简报归档: $FORMATTED_DATE" && \
    git -C "$BRIEFINGS" push origin main 2>&1 && \
    echo "🚀 已推送到 GitHub Pages" || \
    echo "⚠️  推送失败，请检查网络"
fi

echo ""
echo "🌐 在线网站: https://lucylook6-design.github.io/landy-briefings/"
echo "🌐 本地预览: file://$BRIEFINGS/index.html"

#!/bin/bash
# 自动归档 openclaw 生成的日报到网站并推送 GitHub Pages
# 💡 协作规范：不修改 index.html，只修改 reports-data.json + reports/*.html

WORKSPACE=~/.openclaw/workspace
BRIEFINGS=~/简报网站
REPORTS=$BRIEFINGS/reports
JSON="$BRIEFINGS/reports-data.json"

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

# 提取标题和描述（使用 python3 避免 grep/sed 编码问题）
TITLE=$(python3 -c "
with open('$TARGET', 'r', encoding='utf-8') as f:
    content = f.read()
import re
m = re.search(r'<h1[^>]*>([^<]+)', content)
if m:
    t = m.group(1).strip()
    # 移除 HTML 标签
    t = re.sub(r'<[^>]+>', '', t)
    print(t)
else:
    print('')
" 2>/dev/null)
DESC=$(python3 -c "
with open('$TARGET', 'r', encoding='utf-8') as f:
    content = f.read()
import re
items = re.findall(r'<li>\\s*<strong>([^<]+)', content)[:3]
print(' · '.join(items))
" 2>/dev/null)
[ -z "$TITLE" ] && TITLE="每日简报"
[ -z "$DESC" ] && DESC="液冷 · AI · 资本市场情报"

# 🆕 更新 reports-data.json（改为在数组开头插入新记录）
if [ -f "$JSON" ]; then
  # 检查是否已存在
  if grep -q "\"$FORMATTED_DATE\"" "$JSON"; then
    echo "ℹ️  $FORMATTED_DATE 已存在于 reports-data.json，跳过"
  else
    NEW_RECORD="  {\n    \"date\": \"$FORMATTED_DATE\",\n    \"title\": \"$TITLE\",\n    \"desc\": \"$DESC\",\n    \"tags\": [\"ai\", \"stock\", \"energy\"],\n    \"file\": \"reports/$FORMATTED_DATE.html\"\n  },"
    # 在第一个 [ 后插入新记录（数组开头）
    # 使用 python3 替换避免 LC_ALL=C sed 损坏 UTF-8
    python3 -c "
import json
with open('$JSON', 'r', encoding='utf-8') as f:
    data = json.load(f)
new_entry = {
    'date': '$FORMATTED_DATE',
    'title': '''$TITLE''',
    'desc': '''$DESC''',
    'tags': ['ai', 'stock', 'energy'],
    'file': 'reports/$FORMATTED_DATE.html'
}
data.insert(0, new_entry)
with open('$JSON', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=2)
    f.write('\n')
" 2>&1 || {
      echo '⚠️  python3 插入失败，回退到 sed 方法'
      LC_ALL=C sed -i.bak "s|\[|[\n$NEW_RECORD|" "$JSON"
    }
    echo "✅ 已更新 reports-data.json"
  fi
else
  echo "⚠️  reports-data.json 不存在，跳过数据更新（请在简报任务中手动创建）"
fi

# 拉取最新代码，避免冲突
cd "$BRIEFINGS"
echo "🔄 拉取远程最新代码..."
git pull origin main --rebase 2>&1 || echo "⚠️  rebase 失败，可能无远程变更"

# Git 提交并推送（禁止 --force！）
git add reports/$FORMATTED_DATE.html reports-data.json
# 也添加可能修改的 archive.sh
git add archive.sh 2>/dev/null

if git diff --cached --quiet; then
  echo "ℹ️  无新变更，无需推送"
  exit 0
fi

git commit -m "简报归档: $FORMATTED_DATE"

PUSH_OK=false
for TRY in 1 2 3; do
  echo "🔄 推送尝试 $TRY/3..."
  if git push origin main 2>&1; then
    PUSH_OK=true
    break
  fi
  echo "⚠️  第 $TRY 次推送失败，拉取远程变更后重试..."
  sleep 3
  git pull origin main --rebase 2>&1 || echo "⚠️  rebase 失败，继续尝试..."
done

if [ "$PUSH_OK" = true ]; then
  echo "🚀 已推送到 GitHub Pages"
else
  echo "⚠️  推送 3 次均失败，需要手动处理"
  echo "  请执行: cd ~/简报网站 && git status"
fi

echo ""
echo "🌐 在线网站: https://lucylook6-design.github.io/landy-briefings/"
echo "🌐 本地预览: file://$BRIEFINGS/index.html"

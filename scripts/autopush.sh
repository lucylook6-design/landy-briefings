#!/bin/bash
# 开机/每30分钟自动补推未同步的简报

BRIEFINGS=~/briefings
LOG="$BRIEFINGS/autopush.log"

# 动态读取系统代理
PROXY_PORT=$(scutil --proxy 2>/dev/null | grep HTTPSPort | awk '{print $3}')
if [ -n "$PROXY_PORT" ]; then
  export https_proxy=http://127.0.0.1:$PROXY_PORT
  export http_proxy=http://127.0.0.1:$PROXY_PORT
fi

# 检查是否有未推送的提交
UNPUSHED=$(git -C $BRIEFINGS log origin/main..HEAD --oneline 2>/dev/null | wc -l | tr -d ' ')

if [ "$UNPUSHED" -gt "0" ]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 发现 $UNPUSHED 个未推送提交，开始补推..."
  git -C $BRIEFINGS push origin main 2>&1
  if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ 补推成功"
  else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ⚠️  补推失败，等待下次重试"
  fi
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✓ 无需补推"
fi

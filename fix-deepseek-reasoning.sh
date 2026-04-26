#!/bin/bash
# 修复 DeepSeek reasoning_content 400 错误

CONFIG=~/.openclaw/openclaw.json
BACKUP=~/.openclaw/openclaw.json.backup-$(date +%Y%m%d-%H%M%S)

echo "🔧 修复 DeepSeek reasoning_content 错误..."
echo ""

# 备份配置
cp "$CONFIG" "$BACKUP"
echo "✅ 已备份配置到: $BACKUP"

# 方案：将 DeepSeek 的 reasoning 设置为 false
# 这样可以避免 reasoning_content 的问题
cat "$CONFIG" | \
  python3 -c "
import sys, json
config = json.load(sys.stdin)
for model in config.get('models', {}).get('providers', {}).get('deepseek', {}).get('models', []):
    if model.get('id') == 'deepseek-chat':
        model['reasoning'] = False
        print('✅ 已将 deepseek-chat 的 reasoning 设置为 false', file=sys.stderr)
json.dump(config, sys.stdout, indent=2, ensure_ascii=False)
" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"

echo "✅ 配置已更新"
echo ""
echo "📝 说明："
echo "   - DeepSeek 的 reasoning 模式已禁用"
echo "   - 这将避免 'reasoning_content must be passed back' 错误"
echo "   - 如需恢复，可从备份文件恢复"
echo ""
echo "🔄 请重启 OpenClaw 使配置生效："
echo "   pkill -f openclaw"
echo "   openclaw gateway --port 18789"

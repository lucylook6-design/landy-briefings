#!/bin/bash
# 安装 git pre-push 钩子，防止误删关键文件
# 用法: bash scripts/install-hooks.sh

HOOK_DIR="$(git rev-parse --git-dir)/hooks"
HOOK_FILE="$HOOK_DIR/pre-push"

cat > "$HOOK_FILE" << 'HOOK_EOF'
#!/bin/bash
# pre-push 安全检查 —— 确保 index.html 和 reports-data.json 不被删除

CRITICAL_FILES=("index.html" "reports-data.json" "research-data.json")

# 获取即将推送的commit范围
while read local_ref local_sha remote_ref remote_sha; do
    if [ "$local_sha" = "0000000000000000000000000000000000000000" ]; then
        continue  # 删除分支，跳过
    fi

    # 确定比对范围
    if [ "$remote_sha" = "0000000000000000000000000000000000000000" ]; then
        range="$local_sha"
    else
        range="$remote_sha..$local_sha"
    fi

    for file in "${CRITICAL_FILES[@]}"; do
        # 检查文件是否存在于最新commit中
        if ! git cat-file -e "$local_sha:$file" 2>/dev/null; then
            echo ""
            echo "❌ 推送被阻止！"
            echo "   关键文件 '$file' 在提交 $local_sha 中丢失了。"
            echo "   这可能是 git 操作出错导致的，请不要 force push。"
            echo ""
            echo "👉 修复方法："
            echo "   git show origin/main:$file > $file   # 从远程恢复文件"
            echo "   git add $file && git commit -m 'fix: 恢复 $file'"
            echo "   git push"
            echo ""
            exit 1
        fi

        # 额外检查：文件是否为空（被截断）
        size=$(git cat-file -s "$local_sha:$file" 2>/dev/null)
        if [ -n "$size" ] && [ "$size" -lt 100 ]; then
            echo ""
            echo "⚠️  警告：关键文件 '$file' 异常小 (${size} bytes)，请确认是否正确。"
            echo "   如果确认无误，可以用 git push --no-verify 跳过此检查。"
            echo ""
            exit 1
        fi
    done
done

echo "✅ 关键文件检查通过 (index.html / reports-data.json / research-data.json)"
exit 0
HOOK_EOF

chmod +x "$HOOK_FILE"
echo "✅ pre-push 钩子已安装到 $HOOK_FILE"

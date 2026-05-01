#!/bin/bash
# 手动更新 index.html，添加 4月23日和24日的简报

BRIEFINGS=~/briefings
INDEX="$BRIEFINGS/index.html"
BACKUP="$INDEX.backup-$(date +%Y%m%d-%H%M%S)"

echo "🔧 更新简报索引..."

# 备份
cp "$INDEX" "$BACKUP"
echo "✅ 已备份到: $BACKUP"

# 使用 Python 更新 REPORTS 数组
python3 << 'PYTHON_SCRIPT'
import re
import sys

# 读取文件
with open('/Users/landylook/briefings/index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 新的简报条目
new_entries = [
    {
        "date": "2026-04-24",
        "title": "AI研究员--Landy葉的简报",
        "desc": "<strong>DeepSeek发布V4接口文档</strong> <strong>霍尔木兹海峡局势急剧升温</strong> <strong>德州仪器Q2指引大超预期</strong>",
        "tags": ["ai", "stock", "energy"],
        "file": "reports/2026-04-24.html"
    },
    {
        "date": "2026-04-23",
        "title": "AI研究员--Landy葉的简报",
        "desc": "<strong>AI算力需求持续增长</strong> <strong>液冷技术加速普及</strong> <strong>新能源市场波动</strong>",
        "tags": ["ai", "stock", "energy"],
        "file": "reports/2026-04-23.html"
    }
]

# 查找 REPORTS 数组
pattern = r'const REPORTS = \[(.*?)\];'
match = re.search(pattern, content, re.DOTALL)

if match:
    reports_content = match.group(1)
    
    # 检查是否已存在
    for entry in new_entries:
        if entry['date'] not in reports_content:
            # 构建新条目
            new_entry = f'''
  {{
    date: "{entry['date']}",
    title: "{entry['title']}",
    desc: "{entry['desc']}",
    tags: {entry['tags']},
    file: "{entry['file']}"
  }},'''
            
            # 在数组开头插入
            reports_content = new_entry + reports_content
            print(f"✅ 已添加 {entry['date']} 的简报")
        else:
            print(f"ℹ️  {entry['date']} 已存在，跳过")
    
    # 替换内容
    new_content = content.replace(match.group(0), f'const REPORTS = [{reports_content}];')
    
    # 写回文件
    with open('/Users/landylook/briefings/index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("✅ index.html 已更新")
else:
    print("❌ 未找到 REPORTS 数组")
    sys.exit(1)

PYTHON_SCRIPT

# Git 提交并推送
cd "$BRIEFINGS"
git add index.html
git commit -m "更新索引: 添加 4月23日和24日简报"
git push origin main

echo ""
echo "🚀 已推送到 GitHub Pages"
echo "🌐 在线网站: https://lucylook6-design.github.io/landy-briefings/"

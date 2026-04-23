---
inclusion: always
---

# 项目上下文

## 当前项目
AI驱动简历筛选系统（HR智能体），需求文档位于 `.kiro/specs/ai-resume-screening/`

## 已完成工作
- 完整六阶段需求分析（discovery → sort → requirements → clarification → validation → prd）
- 数据模型（data-model.md）
- 需求追溯矩阵（rtm.md）
- 静态HTML交互原型（prototype/）含简历详情页

## 环境配置
- OpenClaw 安装于 `/usr/local/bin/openclaw`，配置文件 `~/.openclaw/openclaw.json`
- MiniMax M2.7 已配置为 OpenClaw 的 minimax provider，endpoint: `https://api.minimaxi.com/v1`
- OpenClaw 启动命令：`openclaw gateway --port 18789`，访问 `127.0.0.1:18789`

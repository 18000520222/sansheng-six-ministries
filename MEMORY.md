# MEMORY.md — Long-Term Memory

> 吏部管理 · Mem0 模式三层记忆
> ONLY loaded in main session. DO NOT share in group contexts.

---

## 身份

- **我**: OpenClaw 2026.3.8，运行在 deepseek-v4-pro 上
- **框架**: 三省六部制，对标 MetaGPT + Dify + LangGraph
- **神将体系**: 六部各配神将（狄仁杰/聚宝/文魁/飞廉/商鞅/鲁班）
- **上下文**: 1M context window，max 32768 tokens

## 用户

- **GitHub**: 18000520222 (待完善 USER.md)
- **偏好**: 简洁直接的回复，中文优先
- **核心项目**: 鸿蒙 AI 智能助手 (harmony-ai-assistant)

---

## 关键决策记录

### 2026-05-31: 三省六部架构确立
- 采用「三省六部」而非「总经理+九部制」作为 Agent 内部框架
- 三省（中书/门下/尚书）做决策流水线
- 六部（吏/户/礼/兵/刑/工）做执行机构
- 参考 MetaGPT SOP 模式、CrewAI Role 定义

### 2026-05-31: 鸿蒙项目从三省六部制改为九部制
- 用户面向产品用了「总经理+九部制」的现代公司架构
- 9 大部配神将代号，Kimi API 对接完成
- 微信 SDK 框架就绪，待腾讯插件安装

### 2026-06-01: Gateway 修复 + 六部开源武装
- 上下文从 16K 爆到 1M
- 每部配备 4-8 个全球顶级开源项目
- 总计 960k+ GitHub star 的武器库

---

## 经验教训

1. **Gateway 不能从内部重启** — 沙箱阻止子进程杀父进程，需外部手动重启
2. **CREDENTIALS.md 必须 gitignore** — 已配置，但 ghp_ token 需尽快更换
3. **心跳卡死** — 上下文超载 >400% 时压缩失效，需定期清理
4. **联网搜索** — 当前版本 (2026.3.8-beta) 不含 tavily/duckduckgo 插件，需升级

---

## 待办事项

- [ ] 升级 openclaw 到最新版（解锁 Tavily 联网搜索）
- [ ] 更换 GitHub token (ghp_ → github_pat_)
- [ ] 鸿蒙项目：安装腾讯插件 + 微信 AppID 注册
- [ ] GitHub push 三省六部全量代码
- [ ] 完善 USER.md 用户画像

---

_本文由吏部维护，每周提炼更新。_

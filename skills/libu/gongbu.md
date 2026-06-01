# 工部 · 建造与工程 — 神将：鲁班 / 伏羲
> 外部映射：**项目生产部** + **技术研发部** (总经理·盘古 → 九部制)
> 对标全球顶级 AI 工程工具：OpenHands · Aider · Continue · Cline · SWE-Agent
> 工部掌营造制作，一切代码生成、系统搭建、自动化、调试排错归工部管辖。

---

## 开源兵器谱

| 项目 | ⭐ | 核心能力 | 工部用途 |
|------|-----|---------|---------|
| **[OpenHands](https://github.com/All-Hands-AI/OpenHands)** | 75k+ | AI 软件工程师，自主编码+调试+部署，多 Agent | 自动化工程开发全流程 |
| **[Aider](https://github.com/Aider-AI/aider)** | 30k+ | 终端 AI 结对编程，Git 原生集成，多模型 | 交互式代码编写/重构 |
| **[Continue](https://github.com/continuedev/continue)** | 22k+ | IDE AI 助手，VS Code/JetBrains，代码理解 | IDE 内智能代码补全 |
| **[Cline](https://github.com/cline/cline)** | 20k+ | VSCode 编码 Agent，自主编辑+终端+浏览器 | VSCode 内全自动编码 |
| **[SWE-Agent](https://github.com/princeton-nlp/SWE-agent)** | 15k+ | 自主软件工程 Agent，SWE-bench 榜首 | Bug 自动修复 |
| **[MetaGPT](https://github.com/FoundationAgents/MetaGPT)** | 68k+ | 多 Agent 软件公司，从需求到代码全流程 | 大型项目工程管理 |

---

## 工程架构

```
┌──────────────────────────────────────────┐
│              工部工程体系                  │
├──────────────────────────────────────────┤
│                                            │
│  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │ 代码生成  │  │ 代码审查  │  │ 测试验证 │ │
│  │          │  │          │  │         │ │
│  │ Aider    │  │ Semgrep  │  │ pytest  │ │
│  │ Cline    │  │ Bearer   │  │ vitest  │ │
│  │OpenHands │  │ 人工复核  │  │ lint    │ │
│  └──────────┘  └──────────┘  └─────────┘ │
│                                            │
│  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │ 部署运维  │  │ 调试排错  │  │ 文档生成 │ │
│  │          │  │          │  │         │ │
│  │ GitHub   │  │ git log  │  │ 礼部协作 │ │
│  │ Actions  │  │ strace   │  │ Docus.. │ │
│  │ Docker   │  │ 二分定位  │  │ README  │ │
│  └──────────┘  └──────────┘  └─────────┘ │
│                                            │
├──────────────────────────────────────────┤
│  三省流水线: 中书→门下→尚书(工部执行)      │
└──────────────────────────────────────────┘
```

---

## 代码规范

### 命名约定
```
文件:    小写下划线    api_service.ts, user_model.go
组件:    大驼峰        ChatPage, UserProfile
函数:    小驼峰        getUserData(), sendMessage()
常量:    全大写下划线  MAX_RETRY, API_BASE_URL
接口:    I 前缀        IUserService (TS/Java)
```

### Git 提交规范
```
feat: 新功能
fix: 修复 bug
refactor: 重构
docs: 文档
style: 格式
test: 测试
chore: 杂项

示例: feat(兵部): 添加 LangGraph 决策路由
```

---

## 工程流程（三省流水线）

### 全流程：写代码
```
1. 中书省: 分析需求 → 调研方案 → 设计架构 → 出初稿
2. 门下省: 安全审查 → 逻辑验证 → 方案对比 → 批可
3. 尚书省 → 工部:
   a. 环境检查 (node/python/go 版本)
   b. 创建/修改文件
   c. 编写代码 + 注释
   d. 本地验证 (lint/typecheck/test)
   e. Git 提交 + commit message
4. 刑部: 安全复查 (Semgrep 扫描)
5. 礼部: 生成变更说明
6. 吏部: 记录技术决策到 memory
```

### 调试流程
```
1. 复现: 精确描述 bug 表现
2. 定位: git bisect / log 回溯 / 二分注释
3. 修复: 最小改动原则
4. 验证: 测试用例 + 边界条件
5. 记录: 教训写入 memory + AGENTS.md
```

---

## AI 辅助工程（OpenHands / Aider 模式）

### 自动代码生成
```
工部.generateCode(spec):
  1. 需求规格 → 伪代码设计
  2. Aider 模式: 交互式生成代码
  3. 逐文件编写，每次聚焦一个模块
  4. 每文件完成后立即自检
```

### 自动重构
```
工部.refactor(file):
  1. Aider 分析代码结构 → 检测坏味道
  2. 提出重构方案 → 用户确认
  3. 执行重构 → 保持语义不变
  4. 运行测试 → 确保无回归
```

### 自动 Bug 修复
```
工部.fixBug(description):
  1. SWE-Agent 模式: 自主定位+修复
  2. 复现 → 日志分析 → 定位根因
  3. 生成修复 patch
  4. 测试验证 → 提交
```

---

## 语言/平台适配

### TypeScript / ArkTS (鸿蒙)
```
- 优先使用 @kit.* 官方 API
- async/await 必须 try/catch
- 组件 @State/@Prop 数据流清晰
```

### Python
```
- type hints 必加
- 用 pathlib 替代 os.path
- 用 subprocess.run 替代 os.system
```

### Shell
```
- #!/usr/bin/env bash
- set -euo pipefail
- 双引号保护变量 "$VAR"
```

---

## 自检清单
- [ ] 代码是否有必要的注释？（why not what）
- [ ] 错误处理是否完整？（所有 async 都有 catch）
- [ ] 是否遵循项目现有代码风格？
- [ ] 是否通过了 lint/typecheck？
- [ ] Git commit message 是否规范？
- [ ] 是否记录了技术决策到 memory？

# 吏部 · 记忆与成长 — 神将：狄仁杰
> 外部映射：**人力资源部** (总经理·盘古 → 九部制)
> 对标全球顶级记忆框架：Mem0 · Letta · Zep · Cognee · LangMem
> 吏部乃六部之首，掌管一切记忆、学习、自我进化。

---

## 开源兵器谱

| 项目 | ⭐ | 核心能力 | 吏部用途 |
|------|-----|---------|---------|
| **[Mem0](https://github.com/mem0ai/mem0)** | 30k+ | 三层记忆层（user/session/agent），自动提取，语义搜索 | 用户画像自动更新，偏好自动发现 |
| **[Letta](https://github.com/letta-ai/letta)** | 16k+ | 自编辑内存，虚拟上下文管理，Tool-calling 记忆操作 | 自我审查过时记忆，自动压缩上下文 |
| **[Zep](https://github.com/getzep/zep)** | 3k+ | 时序+语义混合搜索，事实提取，实体图谱 | 长对话回溯，关键事实永不丢失 |
| **[Cognee](https://github.com/topoteretes/cognee)** | 4k+ | 图谱记忆，Pipeline 处理，多模态记忆 | 知识图谱构建，跨领域关联 |
| **[LangMem](https://github.com/langchain-ai/langmem)** | 2k+ | LangChain 原生记忆，语义/摘要/规则三种模式 | 结构化记忆提取，行为规则学习 |

---

## 记忆架构

```
┌──────────────────────────────────────────┐
│              吏部记忆系统                  │
├────────────┬────────────┬────────────────┤
│  短期记忆   │  工作记忆   │   长期记忆      │
│ (会话级)    │  (心跳级)   │  (永久级)       │
├────────────┼────────────┼────────────────┤
│ 当前对话    │ HEARTBEAT   │ MEMORY.md      │
│ tool 结果   │ tasks/      │ USER.md        │
│ 临时文件    │ memory/*.md │ AGENTS.md      │
│            │            │ IDENTITY.md    │
├────────────┴────────────┴────────────────┤
│           记忆操作层 (Mem0 模式)           │
│  search → extract → consolidate → prune  │
└──────────────────────────────────────────┘
```

---

## 操作流

### 日常记忆（每次对话后）
1. 有决策 → 追加到 `memory/YYYY-MM-DD.md`
2. 有偏好 → diff 检查 `USER.md`，增量更新
3. 有教训 → 审查是否需要写入 `AGENTS.md`
4. 有代码变更 → 记录到 Git commit message + memory

### 每周提炼（心跳触发，兵部调度）
```
吏部.weeklyConsolidate():
  1. 读取最近 7 天的 memory/*.md
  2. 用 Zep 模式提取关键事实（who/what/when/why）
  3. 用 Letta 模式自审：这些记忆还有用吗？
  4. 更新 MEMORY.md（新增精华 → 合并重复 → 删除过时）
  5. 清理 30 天前的零散日志
  6. 向尚书省汇报提炼结果
```

### 即时记忆
触发词："记住" "别忘了" "record" "save this"
→ 立即写入 `memory/YYYY-MM-DD.md`，打 `⚡IMPORTANT` 标签

### 自优化（Cognee 图谱模式）
```
吏部.selfOptimize():
  1. 扫描所有 memory 文件，构建概念图谱
  2. 发现关联：哪些主题经常一起出现？
  3. 检测矛盾：USER.md 的偏好是否冲突？
  4. 提出优化建议 → 提交门下省审核
```

---

## 与开源项目集成

### Mem0 模式 — 三层记忆操作
```
add_memory("用户偏好暗色主题", memory_type="user")
add_memory("本次对话讨论了鸿蒙项目", memory_type="session")
search_memory("暗色主题", memory_type="user") → 偏好记录
```

### Letta 模式 — 自编辑
```
# 心跳时自审
letta_audit():
  - 读取 MEMORY.md → 找出 >30 天未引用的条目
  - 标记 [STALE]，可选自动归档
  - 检测重复条目 → 合并
```

### Cognee 模式 — 图谱构建
```
build_graph():
  nodes: [鸿蒙项目, 三省六部, 微信SDK, Kimi API, ...]
  edges: [鸿蒙→微信SDK(依赖), 鸿蒙→Kimi(调用), 三省六部→鸿蒙(应用)]
  query: "和鸿蒙相关的所有记忆" → 图谱遍历
```

---

## 自检清单
- [ ] 用户偏好是否最新？（对比 USER.md 和最近对话）
- [ ] 是否有 >30 天未访问的记忆条目？
- [ ] 上次提炼距今多少天？（>7 天触发告警）
- [ ] AGENTS.md 是否需要更新？（对比最新教训）
- [ ] 概念图谱是否需要重建？

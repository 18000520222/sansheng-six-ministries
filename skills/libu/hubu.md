# 户部 · 资源与数据 — 神将：聚宝
> 外部映射：**财务部** + **数据统计部** (总经理·盘古 → 九部制)
> 对标全球顶级数据工程：DuckDB · Evidence · LiteFS · Superset · SQLite
> 户部掌天下财赋，一切文件、数据、凭证、统计归户部管辖。

---

## 开源兵器谱

| 项目 | ⭐ | 核心能力 | 户部用途 |
|------|-----|---------|---------|
| **[DuckDB](https://github.com/duckdb/duckdb)** | 26k+ | 进程内 OLAP 数据库，SQL 直接查 CSV/Parquet/JSON | 项目数据即时统计分析 |
| **[Evidence](https://github.com/evidence-dev/evidence)** | 5k+ | Markdown 驱动 BI，SQL → 图表 → 报告 | 自动生成项目仪表盘和报告 |
| **[LiteFS](https://github.com/superfly/litefs)** | 4k+ | 分布式 SQLite，多节点复制 | 记忆文件跨设备同步 |
| **[Apache Superset](https://github.com/apache/superset)** | 65k+ | 企业级 BI 平台，可视化数据探索 | 复杂数据分析，可视化大盘 |
| **[SDS](https://github.com/OpenCSGs/sds)** | 2k+ | 结构化数据存储，Agent 数据后端 | 为六部提供统一数据层 |

---

## 数据架构

```
┌──────────────────────────────────────────┐
│              户部数据系统                  │
├────────────┬────────────┬────────────────┤
│  文件层     │  数据层     │   凭证层        │
│  (存储)     │  (分析)     │  (安全)         │
├────────────┼────────────┼────────────────┤
│ workspace/ │ DuckDB SQL │ CREDENTIALS.md │
│ projects/  │ Evidence   │ .env           │
│ scripts/   │ Superset   │ tokens/        │
│ data/      │ LiteFS     │ keys/          │
├────────────┴────────────┴────────────────┤
│           数据操作层 (ETL + Query)         │
│  collect → store → analyze → visualize   │
└──────────────────────────────────────────┘
```

---

## 操作流

### 项目盘存（心跳触发）
```
户部.inventory():
  1. 扫描 workspace 所有文件 → 生成目录树
  2. 统计文件类型分布 (Markdown / 代码 / 配置 / 二进制)
  3. DuckDB 查询: 文件数量、总大小、最近修改时间
  4. 检查 .gitignore 是否保护了敏感文件
  5. 生成 Inventory Report → 提交尚书省
```

### 凭证安全审计（每周）
```
户部.auditCredentials():
  1. 读取 CREDENTIALS.md → 提取所有 token 类型和前缀
  2. 检查: ghp_ token → GitHub 已禁用此格式 (2024 Q1)
     → 高优先级告警: 需更换为 github_pat_ 格式
  3. 检查: 静态 API key 是否超过 90 天未轮换
  4. 生成审计报告 → 提交刑部复核
```

### 数据统计（DuckDB 模式）
```sql
-- 文件类型分布
SELECT ext, COUNT(*) as cnt, SUM(size) as total
FROM workspace_files
GROUP BY ext
ORDER BY total DESC;

-- 最近活动热力图
SELECT DATE(mtime) as day, COUNT(*) as changes
FROM workspace_files
WHERE mtime > DATE('now', '-30 days')
GROUP BY day;
```

### 可视化报告（Evidence 模式）
```
户部.generateReport(topic):
  1. SQL 查询相关数据
  2. Evidence 渲染为图表
  3. 生成 Markdown 报告
  4. 自动推送到对应频道
```

---

## 文件操作规范

### 安全读写
- 大文件 (>10MB)：先确认再操作
- 二进制文件：不直接编辑，用 exec 工具处理
- 配置文件：修改前备份 `.bak`
- 删除操作：优先 `trash`，次选 `mv`，最后 `rm`

### 目录结构维护
```
户部.organize():
  1. 检测临时文件 (tmp/, *.tmp, *.bak.2, *.bak.3...)
  2. 清理 7 天前的临时文件
  3. 统一命名规范
  4. 归档旧日志 (>30 天 → archive/)
```

---

## 自检清单
- [ ] 项目目录树是否最新？（对比实际文件和 docs 记录）
- [ ] 凭证是否需要轮换？（ghp_ 格式需立即更换！）
- [ ] 临时文件是否超过 20 个？（触发清理）
- [ ] Git 是否有未提交变更？
- [ ] 磁盘空间是否充足？

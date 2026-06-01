# 户部 · 资源与数据

## 职能
文件管理、数据统计、凭证维护、资源监控

## 数据目录
```
workspace/
├── MEMORY.md          ← 长期记忆
├── USER.md            ← 用户画像
├── SANSHENG.md        ← 运行框架
├── AGENTS.md          ← 行为准则
├── TOOLS.md           ← 工具配置
├── HEARTBEAT.md       ← 心跳任务
├── harmony-ai-assistant/ ← 鸿蒙项目
├── memory/            ← 日志
├── skills/            ← 技能
├── scripts/           ← 脚本
└── data/              ← 数据
```

## 操作命令

### 文件统计
```bash
find workspace -type f | wc -l           # 总文件数
du -sh workspace/                        # 总大小
find workspace -name "*.md" | wc -l      # Markdown 文件数
```

### 项目盘点
```bash
cd harmony-ai-assistant
git status --short
git log --oneline -5
```

### 凭证检查
检查 CREDENTIALS.md 中所有 token 是否有效

## 自检清单
- [ ] 项目结构是否整洁？
- [ ] 凭证是否最新？
- [ ] 有没有遗留的临时文件？

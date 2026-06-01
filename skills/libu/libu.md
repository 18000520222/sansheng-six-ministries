# 礼部 · 表达与格式 — 神将：文魁
> 外部映射：**文案策划部** (总经理·盘古 → 九部制)
> 对标全球顶级写作/表达工具：Slidev · Docusaurus · Marp · Obsidian · MDX
> 礼部掌文书典制，一切文字输出、格式适配、多平台表达归礼部管辖。

---

## 开源兵器谱

| 项目 | ⭐ | 核心能力 | 礼部用途 |
|------|-----|---------|---------|
| **[Slidev](https://github.com/slidevjs/slidev)** | 35k+ | Markdown 写 PPT，代码高亮、动画、演讲者模式 | 自动生成演示文稿 |
| **[Docusaurus](https://github.com/facebook/docusaurus)** | 60k+ | React 文档站点，MDX 支持，版本管理 | 项目文档自动搭建 |
| **[Marp](https://github.com/marp-team/marp)** | 9k+ | Markdown 转 PPT/PDF，VS Code 集成 | 快速转演示/报告 |
| **[Obsidian](https://obsidian.md)** | - | 双向链接知识库，图谱视图，插件生态 | 知识管理，笔记互链 |
| **[MDX](https://github.com/mdx-js/mdx)** | 18k+ | Markdown + JSX，组件化文档 | 交互式文档/演示 |

---

## 多平台格式引擎

```
┌──────────────────────────────────────────┐
│              礼部表达引擎                  │
├──────────────────────────────────────────┤
│  输入: 结构化内容 (Markdown AST)          │
│         ↓                                │
│  ┌──────┬──────┬──────┬──────┬──────┐    │
│  │Discord│微信  │WA    │Email │文档  │    │
│  ├──────┼──────┼──────┼──────┼──────┤    │
│  │无表格 │Emoji │**粗**│正式  │Docus │    │
│  │<>链接│短段  │CAPS  │签名  │Slidev│    │
│  │缩进式│活泼  │≤3行  │称呼  │Marp  │    │
│  └──────┴──────┴──────┴──────┴──────┘    │
│         ↓                                │
│  输出: 平台适配内容                        │
└──────────────────────────────────────────┘
```

---

## 平台规则矩阵

| 平台 | 表格 | 标题 | 链接 | 段落 | Emoji | 特殊规则 |
|------|------|------|------|------|-------|---------|
| Discord | ❌ 列表替 | ✅ | `<>` 包裹 | ≤5行 | ✅ | `[[reply]]` 标签 |
| WhatsApp | ❌ 列表替 | CAPS替 | 直接 | ≤3行 | 适量 | 无标题 |
| 微信 | ❌ 列表替 | ✅ | 直接 | ≤4行 | ✅ 丰富 | 短小精悍 |
| Email | ✅ | ✅ | 完整 | 不限 | 少数 | 正式签名 |
| Slack | ✅ | ✅ | `<>` 包裹 | ≤5行 | ✅ | thread 回复 |
| 文档 | ✅ | ✅ | ✅ | 不限 | ✅ | Docusaurus/MDX |

---

## 写作工作流

### 模板引擎
```
礼部.write(type, topic, context):
  switch type:
    case "报告":
      template = [背景→数据→分析→建议→行动]
    case "教程":
      template = [目标→前置→步骤1..N→总结→FAQ]
    case "推文":
      template = [hook→核心→CTA]
      max_chars = 280
    case "邮件":
      template = [称呼→正文→行动→签名]
    case "文档":
      template = Docusaurus/MDX 格式
```

### 三省流程中的礼部角色
```
中书省产初稿 → 礼部润色 → 门下省审核 → 尚书省分发
```

### 自优化（对比学习）
```
礼部.selfImprove():
  1. 收集用户对过往输出的反馈（修改/重写/赞）
  2. 分析偏好模式：长短？风格？格式？
  3. 更新 USER.md 中的表达偏好
  4. 调整模板和格式规则
```

---

## 文档生成（Docusaurus + Slidev）

### 自动文档站点
```
礼部.generateDocSite(project):
  1. 扫描项目结构 → 生成侧边栏
  2. 提取 README/注释 → 生成文档页
  3. Docusaurus 渲染为静态站点
  4. 可选部署到 GitHub Pages
```

### 自动演示文稿
```
礼部.generateSlides(topic):
  1. 结构化内容 → Slidev Markdown
  2. 自动分页、代码高亮
  3. 生成演讲者备注
  4. 导出 PDF/PPTX
```

---

## 自检清单
- [ ] 目标平台是什么？（自动检测 chatType/channel）
- [ ] 格式适配了吗？（表格→列表，标题→粗体）
- [ ] 语言是否简洁有力？（去掉 "Great question!" 类 filler）
- [ ] 代码块是否标注了语言？
- [ ] 输出长度是否适合目标平台？
- [ ] 是否用了用户偏好的表达风格？

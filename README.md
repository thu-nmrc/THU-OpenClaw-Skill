# ZeeLin-OpenClaw-Skill Repository

欢迎来到 **清新研究团队 (THU-NMRC)** 的 OpenClaw 技能开源仓库集合。

## 🏢 关于团队 (About Us)
本仓库由清华大学清新研究团队维护。我们主要致力于**科研探索**与**舆情走向分析 (Public Sentiment Analysis)**。
这里汇集了团队成员为 OpenClaw 开发的各类实用开源 Skill (Agent 插件)。所有的 Skill 均围绕数据抓取、舆情研判、学术研究辅助等核心能力构建。

## 📦 包含的技能 (Available Skills)

目前仓库中包含以下主要 Skill：

* [**zeelin-social-watch**](./zeelin-social-watch/): 接入清博智能 (GSData) 开放平台的舆情分析技能。支持全网关键词检索、热点事件探测、平台榜单与账号数据查询。
* [**zeelin-report-publisher**](./zeelin-report-publisher/): 面向“智灵报告网站”的报告发布技能。支持多类别报告自动入库、`reports_config.json` 置顶更新、构建校验与 PR 工作流。

*(团队成员可在此处继续添加新的 Skill 目录和说明)*

## 🚀 如何安装 (Installation)

由于我们采用了 Monorepo（单体仓库）的方式管理多个子技能，当您需要在您的 Agent (如搭载 OpenClaw 的终端或 Telegram 机器人) 中安装特定的 Skill 时，请在 `clawhub install` 命令中指定对应的子目录。

**例如，安装报告发布插件 `zeelin-report-publisher`：**
```bash
clawhub install github:thu-nmrc/ZeeLin-OpenClaw-Skill/zeelin-report-publisher
```

每个子目录内都包含了该 Skill 独立运行所需的 `SKILL.md`、配置文件及详细的使用说明。

## 🤝 团队协作指南 (Contributing)

团队成员在开发新的 Skill 时，请遵循以下规范：
1. **独立目录**: 新技能请在根目录下创建一个独立的文件夹（如 `my-new-skill/`）。
2. **必备文件**: 文件夹内必须包含带有标准 YAML Frontmatter（元数据声明）的 `SKILL.md`，用于指导 Agent 调用。
3. **环境硬隔离**: 敏感的 API Token 请务必在 `SKILL.md` 的 `env` 字段声明，切勿硬编码在代码中。
4. **及时更新文档**: 新增 Skill 后，请 PR 更新本 `README.md` 的技能列表。

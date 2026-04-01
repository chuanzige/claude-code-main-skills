# claude-code-main-skills

这是一个从 `claude-code-main` 源码快照中整理出来的 Codex skills 集合。

这个仓库一共收录了 11 个可复用 skill，主要来源于该代码库中的 coordinator 工作流、验证模型、memory 系统、只读探索流程以及 shell 安全规则。

英文 README：[README.md](./README.md)

## 来源

源码参考：

- https://github.com/ChinaSiro/claude-code-sourcemap

## 内容说明

### 最初的 8 个 Skills

- `coordinator-orchestrator`
- `task-concurrency-patterns`
- `adversarial-verification`
- `self-rationalization-guard`
- `worker-prompt-craft`
- `memory-type-system`
- `smart-memory-guard`
- `lightweight-explorer`

### 我从代码中继续挖掘出的 3 个 Skills

- `session-memory-maintenance`
- `team-memory-routing`
- `read-only-shell-guard`

## 亮点

- 共 11 个可复用 skills
- 清晰区分最初的 8 个与新增发现的 3 个
- 提供中英文说明文档
- 可直接安装到 `~/.codex/skills`
- 附带一键安装脚本和示例目录

## 技能简介

- `coordinator-orchestrator`：协调研究、实现、验证 worker，但不把综合判断外包出去。
- `task-concurrency-patterns`：安全并行只读任务，串行化有冲突的写操作。
- `adversarial-verification`：验证时以“尝试打破实现”为目标，而不是表面放行。
- `self-rationalization-guard`：识别“看起来没问题”之类的自我合理化借口，并转换成具体动作。
- `worker-prompt-craft`：为 worker 或 subagent 编写自包含、可执行的精确指令。
- `memory-type-system`：将 memory 划分为 user、feedback、project、reference 四类。
- `smart-memory-guard`：保证 memory 准确、精简且长期有价值。
- `lightweight-explorer`：使用只读方式快速探索代码库。
- `session-memory-maintenance`：在固定模板和 token 预算限制下维护 session notes。
- `team-memory-routing`：决定 memory 应该写入 private 还是 team 范围。
- `read-only-shell-guard`：判断一个 shell 命令是否真的只读且可安全放行。

## 安装方式

把一个或多个 skill 目录复制到你的 Codex skills 目录：

```bash
mkdir -p ~/.codex/skills
cp -R coordinator-orchestrator ~/.codex/skills/
```

如果要一次安装全部：

```bash
mkdir -p ~/.codex/skills
cp -R adversarial-verification coordinator-orchestrator lightweight-explorer memory-type-system read-only-shell-guard self-rationalization-guard session-memory-maintenance smart-memory-guard task-concurrency-patterns team-memory-routing worker-prompt-craft ~/.codex/skills/
```

安装后请重启 Codex，让它重新加载这些 skill。

也可以直接使用安装脚本：

```bash
./install.sh
```

## 导入到 Claude Code、OpenCode 以及其他主流 AI Coding 工具

这些 skill 采用的是 Codex / Claude 风格的 `SKILL.md` 目录结构。有些工具可以直接使用这种结构，有些则需要把内容改写成它们自己的 command 或 rules 格式。

| 工具 | 原生导入位置 | 推荐导入方式 |
| --- | --- | --- |
| Claude Code | `.claude/skills/` 或 `~/.claude/skills/` | 直接复制整个 skill 目录。Claude Code 原生支持目录式 skills。 |
| Codex | `~/.codex/skills/` | 直接复制整个 skill 目录，安装后重启 Codex。 |
| OpenCode | `.opencode/commands/` 或用户级 OpenCode commands 目录 | 将每个 `SKILL.md` 改写为一个自定义 command markdown 文件。OpenCode 原生支持 commands，不是 Claude 风格 skill 目录。 |
| Cursor | `.cursor/rules/` 或根目录 `AGENTS.md` | 将 skill 改写成一个或多个 Cursor rules，或者提炼核心内容写入 `AGENTS.md`。 |
| Windsurf | `.windsurf/rules/` 或根目录 `AGENTS.md` | 将 skill 改写为 Windsurf rules，或通过 `AGENTS.md` 兼容导入。 |
| Cline | `.clinerules/` 或 `AGENTS.md` | 将每个 skill 改写成一个或多个 Cline rule 文件；Cline 也支持 `AGENTS.md`。 |

### Claude Code

Claude Code 原生支持目录式 skill。直接复制到：

- 项目级：`.claude/skills/`
- 用户级：`~/.claude/skills/`

### OpenCode

OpenCode 原生支持的是 custom commands，而不是 `SKILL.md` 目录。推荐做法：

1. 创建 `.opencode/commands/`
2. 每个 skill 新建一个对应的 markdown command 文件
3. 把 `SKILL.md` 中最重要的指令复制进去
4. 在 frontmatter 中补一个简短描述

所以对于 OpenCode，这属于“改写导入”，不是直接复制即用。

### Cursor

Cursor 不能直接使用 Claude 风格的 skill 目录。推荐两种方式：

- 拆成一个或多个 `.cursor/rules/` 规则文件
- 或把关键内容提炼到仓库根目录的 `AGENTS.md`

如果你的目标是长期生效的项目约束，优先用 rules。

### Windsurf

Windsurf 更适合使用：

- `.windsurf/rules/*.md`
- 或根目录 `AGENTS.md`

如果你希望 Cascade 持续套用这些约束，建议把 skill 改写成 rules。

### Cline

Cline 更适合使用：

- `.clinerules/*.md`
- 或 `AGENTS.md`

如果某个 skill 很长，建议拆成多个规则文件，不要直接把整份内容粗暴塞进一个文件。

## 仓库结构

每个 skill 都是一个独立目录，包含：

- `SKILL.md`
- `agents/openai.yaml`

额外发布资产包括：

- `LICENSE`
- `install.sh`
- `examples/`

## 使用示例

通过 `$skill-name` 显式调用：

```text
Use $adversarial-verification to verify this change by trying to break it.
Use $worker-prompt-craft to turn this task into a self-contained worker prompt.
Use $memory-type-system to decide whether this belongs in memory.
```

更多示例：

- [examples/invocations.md](./examples/invocations.md)

## 源码依据

这些 skill 主要从以下源码模块提炼而来：

- `src/coordinator/coordinatorMode.ts`
- `src/tools/AgentTool/built-in/verificationAgent.ts`
- `src/tools/AgentTool/built-in/exploreAgent.ts`
- `src/memdir/memoryTypes.ts`
- `src/services/SessionMemory/*`
- `src/memdir/teamMemPaths.ts`
- `src/tools/BashTool/readOnlyValidation.ts`
- `src/services/tools/toolOrchestration.ts`

## 说明

- 这个仓库不是官方上游直接导出的 skill 包，而是基于源码行为整理出的可发布版本。
- 这些 skill 面向 Codex 风格的 `SKILL.md` 发现和 `$skill-name` 显式调用。
- 如果后续你要补图标、品牌色或 marketplace 元数据，可以继续扩展 `agents/openai.yaml` 和 `assets/`。

## 许可

本仓库采用：

- [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/)

## 声明

- 本仓库仅用于技术研究与学习，请勿用于商业用途。
- 如有侵权，请联系删除。

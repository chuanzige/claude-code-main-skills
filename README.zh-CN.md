# claude-code-main-skills

这是一个从 `claude-code-main` 源码快照中整理出来的 Codex skills 集合。

这个仓库一共收录了 11 个可复用 skill，主要来源于该代码库中的 coordinator 工作流、验证模型、memory 系统、只读探索流程以及 shell 安全规则。

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

## 仓库结构

每个 skill 都是一个独立目录，包含：

- `SKILL.md`
- `agents/openai.yaml`

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

## 使用示例

通过 `$skill-name` 显式调用：

```text
Use $adversarial-verification to verify this change by trying to break it.
Use $worker-prompt-craft to turn this task into a self-contained worker prompt.
Use $memory-type-system to decide whether this belongs in memory.
```

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

## 声明

- 本仓库仅用于技术研究与学习，请勿用于商业用途。
- 如有侵权，请联系删除。

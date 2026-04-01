# claude-code-main-skills

A curated Codex skills pack extracted from the `claude-code-main` source snapshot.

This repository packages 11 reusable skills derived from the codebase's coordinator workflow, verification model, memory system, read-only exploration flow, and shell safety rules.

Chinese README: [README.zh-CN.md](./README.zh-CN.md)

## Highlights

- 11 reusable Codex skills
- grouped into the original 8 plus 3 additional skills discovered from the codebase
- bilingual repository docs
- ready to copy into `~/.codex/skills`
- includes a one-command installer and examples

## Source

Source reference:

- https://github.com/ChinaSiro/claude-code-sourcemap

## Contents

### Original 8

- `coordinator-orchestrator`
- `task-concurrency-patterns`
- `adversarial-verification`
- `self-rationalization-guard`
- `worker-prompt-craft`
- `memory-type-system`
- `smart-memory-guard`
- `lightweight-explorer`

### Additional 3 Discovered From The Codebase

- `session-memory-maintenance`
- `team-memory-routing`
- `read-only-shell-guard`

## Quick Install

Install all skills at once:

```bash
mkdir -p ~/.codex/skills
cp -R adversarial-verification coordinator-orchestrator lightweight-explorer memory-type-system read-only-shell-guard self-rationalization-guard session-memory-maintenance smart-memory-guard task-concurrency-patterns team-memory-routing worker-prompt-craft ~/.codex/skills/
```

Restart Codex after installation so the new skills are reloaded.

Or use the installer script:

```bash
./install.sh
```

## Import Into Claude Code, OpenCode, And Other AI Coding Tools

These skills are authored in Codex/Claude-style `SKILL.md` format. Some tools support this structure directly, while others require adapting the content into their own command or rules system.

| Tool | Native import path | Recommended way to use this repo |
| --- | --- | --- |
| Claude Code | `.claude/skills/` or `~/.claude/skills/` | Copy each skill folder as-is. Claude Code supports directory-based skills natively. |
| Codex | `~/.codex/skills/` | Copy each skill folder as-is. Restart Codex after install. |
| OpenCode | `.opencode/commands/` or user-level OpenCode commands directory | Convert each `SKILL.md` into a custom command markdown file. OpenCode supports commands natively, not Claude-style skill folders. |
| Cursor | `.cursor/rules/` or root `AGENTS.md` | Adapt a skill into one or more Cursor rules, or merge core instructions into `AGENTS.md`. |
| Windsurf | `.windsurf/rules/` or root `AGENTS.md` | Adapt a skill into Windsurf rules. Root `AGENTS.md` is also a practical compatibility layer. |
| Cline | `.clinerules/` or `AGENTS.md` | Convert each skill into one or more Cline rule files. Cline also recognizes `AGENTS.md`. |

### Claude Code

Claude Code supports directory-based skills natively. Copy the folders into:

- project scope: `.claude/skills/`
- user scope: `~/.claude/skills/`

### OpenCode

OpenCode supports custom commands rather than `SKILL.md` skill folders. The practical import workflow is:

1. Create `.opencode/commands/`
2. Create one markdown command per skill
3. Copy the important instructions from `SKILL.md` into that command file
4. Add a short description in frontmatter

This is an adaptation, not a direct drop-in import.

### Cursor

Cursor does not use Claude-style skill folders directly. Recommended options:

- split a skill into one or more files under `.cursor/rules/`
- or copy the most important instructions into a root `AGENTS.md`

Use rules when you want persistent project behavior rather than explicit invocation.

### Windsurf

Windsurf works best with:

- `.windsurf/rules/*.md`
- or root `AGENTS.md`

Adapt each skill into a rule file when you want Cascade to apply it as persistent guidance.

### Cline

Cline works best with:

- `.clinerules/*.md`
- or `AGENTS.md`

If a skill is large, split it into focused rule files instead of pasting everything into one giant file.

## Skill Summaries

- `coordinator-orchestrator`: Coordinate research, implementation, and verification workers without delegating synthesis.
- `task-concurrency-patterns`: Parallelize read-only work safely and serialize overlapping writes.
- `adversarial-verification`: Verify by trying to break the change, not by rubber-stamping it.
- `self-rationalization-guard`: Catch "looks fine" style excuses and convert them into concrete action.
- `worker-prompt-craft`: Write self-contained prompts for workers and subagents.
- `memory-type-system`: Classify memory into user, feedback, project, and reference types.
- `smart-memory-guard`: Keep memory accurate, compact, and durable.
- `lightweight-explorer`: Explore codebases quickly with read-only search patterns.
- `session-memory-maintenance`: Maintain structured session notes under template and token-budget constraints.
- `team-memory-routing`: Decide whether memory belongs in private or shared team scope.
- `read-only-shell-guard`: Decide whether a shell command is truly read-only and safe.

## Repository Layout

Each skill is a standalone folder containing:

- `SKILL.md`
- `agents/openai.yaml`

Additional repository assets:

- `LICENSE`
- `install.sh`
- `examples/`

## Installation

Install by copying one or more skill folders into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
cp -R coordinator-orchestrator ~/.codex/skills/
```

Or install all skills:

```bash
mkdir -p ~/.codex/skills
cp -R adversarial-verification coordinator-orchestrator lightweight-explorer memory-type-system read-only-shell-guard self-rationalization-guard session-memory-maintenance smart-memory-guard task-concurrency-patterns team-memory-routing worker-prompt-craft ~/.codex/skills/
```

Restart Codex after installation so the new skills are reloaded.

## Example Invocation

Use skills explicitly with `$skill-name`:

```text
Use $adversarial-verification to verify this change by trying to break it.
Use $worker-prompt-craft to turn this task into a self-contained worker prompt.
Use $memory-type-system to decide whether this belongs in memory.
```

More examples:

- [examples/invocations.md](./examples/invocations.md)

## Source Basis

These skills were derived from the following subsystems in the source snapshot:

- `src/coordinator/coordinatorMode.ts`
- `src/tools/AgentTool/built-in/verificationAgent.ts`
- `src/tools/AgentTool/built-in/exploreAgent.ts`
- `src/memdir/memoryTypes.ts`
- `src/services/SessionMemory/*`
- `src/memdir/teamMemPaths.ts`
- `src/tools/BashTool/readOnlyValidation.ts`
- `src/services/tools/toolOrchestration.ts`

## Notes

- This repository contains hand-authored skills derived from source behavior, not an official upstream export.
- The skills are designed for Codex-style `SKILL.md` loading and explicit `$skill-name` invocation.
- If you want icons, brand colors, or marketplace packaging, add them later in `agents/openai.yaml` and `assets/`.

## License

This repository is distributed under:

- [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/)

## Disclaimer

- This repository is for technical research and learning only.
- Do not use it for commercial purposes.
- If any content is infringing, please contact for removal.

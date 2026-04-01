# claude-code-main-skills

A curated Codex skills pack extracted from the `claude-code-main` source snapshot.

This repository packages 11 reusable skills derived from the codebase's coordinator workflow, verification model, memory system, read-only exploration flow, and shell safety rules.

Chinese README: [README.zh-CN.md](./README.zh-CN.md)

## Highlights

- 11 reusable Codex skills
- grouped into the original 8 plus 3 additional skills discovered from the codebase
- bilingual repository docs
- ready to copy into `~/.codex/skills`

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

## Disclaimer

- This repository is for technical research and learning only.
- Do not use it for commercial purposes.
- If any content is infringing, please contact for removal.

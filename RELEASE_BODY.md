# claude-code-main-skills v0.1.0

A curated Codex skills pack extracted from the `claude-code-main` source snapshot.

## What is included

This release contains 11 reusable skills:

### Original 8

- `coordinator-orchestrator`
- `task-concurrency-patterns`
- `adversarial-verification`
- `self-rationalization-guard`
- `worker-prompt-craft`
- `memory-type-system`
- `smart-memory-guard`
- `lightweight-explorer`

### Additional 3 discovered from the codebase

- `session-memory-maintenance`
- `team-memory-routing`
- `read-only-shell-guard`

## Highlights

- extracted from real source behavior rather than generic prompt templates
- includes `SKILL.md` and `agents/openai.yaml` for each skill
- separates the original requested skills from the newly discovered ones
- includes English and Simplified Chinese repository docs

## Installation

Copy the skill folders into your Codex skills directory:

```bash
mkdir -p ~/.codex/skills
cp -R adversarial-verification coordinator-orchestrator lightweight-explorer memory-type-system read-only-shell-guard self-rationalization-guard session-memory-maintenance smart-memory-guard task-concurrency-patterns team-memory-routing worker-prompt-craft ~/.codex/skills/
```

Restart Codex after installation.

## Repository

- README: `README.md`
- Chinese README: `README.zh-CN.md`
- Release notes: `RELEASE_NOTES.md`

## Source reference

- https://github.com/ChinaSiro/claude-code-sourcemap

## Disclaimer

- This repository is for technical research and learning only.
- Do not use it for commercial purposes.
- If any content is infringing, please contact for removal.

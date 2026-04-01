# Skill Invocation Examples

## Original 8

### coordinator-orchestrator

```text
Use $coordinator-orchestrator to split this bugfix into research, implementation, and verification workers.
```

### task-concurrency-patterns

```text
Use $task-concurrency-patterns to decide which parts of this refactor can run in parallel and which writes must stay serialized.
```

### adversarial-verification

```text
Use $adversarial-verification to verify this change by trying to break it instead of just confirming the happy path.
```

### self-rationalization-guard

```text
Use $self-rationalization-guard because I keep explaining what I would test instead of actually running the checks.
```

### worker-prompt-craft

```text
Use $worker-prompt-craft to turn this issue into a precise self-contained worker prompt with file paths and done criteria.
```

### memory-type-system

```text
Use $memory-type-system to decide whether this belongs in user, feedback, project, or reference memory.
```

### smart-memory-guard

```text
Use $smart-memory-guard to decide whether this memory should be kept, condensed, updated, or deleted.
```

### lightweight-explorer

```text
Use $lightweight-explorer to find the relevant files and tests before making any edits.
```

## Additional 3

### session-memory-maintenance

```text
Use $session-memory-maintenance to update the session notes without breaking the template or exceeding the token budget.
```

### team-memory-routing

```text
Use $team-memory-routing to decide whether this memory should stay private or be saved into shared team memory.
```

### read-only-shell-guard

```text
Use $read-only-shell-guard to decide whether this shell command is truly read-only or should go through stricter permission handling.
```

## Cross-Tool Adaptation Prompts

### OpenCode

```text
Convert the key instructions from $worker-prompt-craft into an OpenCode custom command markdown file.
```

### Cursor

```text
Adapt $adversarial-verification into a Cursor rule for backend verification work.
```

### Cline

```text
Split $smart-memory-guard into one or more .clinerules files for persistent project use.
```

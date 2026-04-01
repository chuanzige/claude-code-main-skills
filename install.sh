#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SKILLS=(
  adversarial-verification
  coordinator-orchestrator
  lightweight-explorer
  memory-type-system
  read-only-shell-guard
  self-rationalization-guard
  session-memory-maintenance
  smart-memory-guard
  task-concurrency-patterns
  team-memory-routing
  worker-prompt-craft
)

mkdir -p "$TARGET_DIR"

for skill in "${SKILLS[@]}"; do
  src="$SCRIPT_DIR/$skill"
  dst="$TARGET_DIR/$skill"

  if [[ ! -d "$src" ]]; then
    echo "Missing skill directory: $src" >&2
    exit 1
  fi

  rm -rf "$dst"
  cp -R "$src" "$dst"
  echo "Installed: $skill -> $dst"
done

echo
echo "Installed ${#SKILLS[@]} skills into: $TARGET_DIR"
echo "Restart Codex to pick up the new skills."

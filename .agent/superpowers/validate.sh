#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SP="$ROOT/.agent/superpowers"
PLATFORM_DOC="$ROOT/docs/CODEX_PLATFORM_GUIDE.md"
EXAMPLES_DOC="$ROOT/docs/PROJECT_EXAMPLES.md"
AGENT_FILE="$ROOT/.agent/AGENT.md"
CODEX_INSTALL="$ROOT/.codex/INSTALL.md"

required_files=(
  "$SP/commands.md"
  "$SP/workflows.md"
  "$SP/features/bootstrap.md"
  "$SP/features/brainstorm.md"
  "$SP/features/research.md"
  "$SP/features/spec.md"
  "$SP/features/implement.md"
  "$SP/features/review.md"
  "$SP/features/retro.md"
  "$SP/features/handoff.md"
  "$SP/policies/methodology.md"
  "$SP/policies/state_machine.md"
)

for f in "${required_files[@]}"; do
  [[ -f "$f" ]] || { echo "missing required file: $f"; exit 1; }
done

[[ -f "$PLATFORM_DOC" ]] || { echo "missing platform guide: $PLATFORM_DOC"; exit 1; }
[[ -f "$EXAMPLES_DOC" ]] || { echo "missing examples doc: $EXAMPLES_DOC"; exit 1; }
[[ -f "$AGENT_FILE" ]] || { echo "missing agent file: $AGENT_FILE"; exit 1; }
[[ -f "$CODEX_INSTALL" ]] || { echo "missing codex install doc: $CODEX_INSTALL"; exit 1; }

required_cmds=("/bootstrap" "/brainstorm" "/research" "/spec" "/plan" "/write-plan" "/implement" "/execute-plan" "/review" "/test" "/retro" "/handoff" "/ship")
for c in "${required_cmds[@]}"; do
  rg -q "^## ${c}$" "$SP/commands.md" || { echo "missing command section: $c"; exit 1; }
done

# Ensure README references implement module (not only old execute mapping)
if [[ -f "$ROOT/README.md" ]]; then
  rg -q "features/implement\.md" "$ROOT/README.md" || { echo "README does not reference implement.md"; exit 1; }
fi

rg -q "CODEX_PLATFORM_GUIDE\.md" "$AGENT_FILE" || { echo "AGENT.md does not reference CODEX_PLATFORM_GUIDE.md"; exit 1; }

if [[ -f "$ROOT/README.md" ]]; then
  rg -q "https://github.com/obra/superpowers" "$ROOT/README.md" || { echo "README missing superpowers reference URL"; exit 1; }
  rg -q "PROJECT_EXAMPLES\.md" "$ROOT/README.md" || { echo "README missing project examples link"; exit 1; }
fi

echo "superpowers validation passed"

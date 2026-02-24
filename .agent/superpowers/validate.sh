#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SP="$ROOT/.agent/superpowers"
PLATFORM_DOC="$ROOT/docs/CODEX_PLATFORM_GUIDE.md"
EXAMPLES_DOC="$ROOT/docs/PROJECT_EXAMPLES.md"
AGENT_FILE="$ROOT/.agent/AGENT.md"
PROJECT_AGENTS_FILE="$ROOT/AGENTS.md"
WORKFLOWS_DIR="$ROOT/.agent/workflows"
CODEX_INSTALL="$ROOT/.codex/INSTALL.md"
CODEX_RULES="$ROOT/.codex/rules/default.rules"

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
  "$ROOT/.agent/skills/systematic-debugging/SKILL.md"
  "$ROOT/.agent/skills/verification-before-completion/SKILL.md"
  "$ROOT/.agent/skills/dispatching-parallel-agents/SKILL.md"
  "$ROOT/.agent/skills/requesting-code-review/SKILL.md"
  "$ROOT/.agent/skills/using-git-worktrees/SKILL.md"
  "$ROOT/.agent/skills/finishing-a-development-branch/SKILL.md"
  "$ROOT/.agent/skills/test-driven-development/SKILL.md"
  "$ROOT/.agent/skills/writing-plans/SKILL.md"
  "$ROOT/.agent/skills/executing-plans/SKILL.md"
  "$ROOT/.agent/skills/subagent-driven-development/SKILL.md"
  "$ROOT/.agent/skills/receiving-code-review/SKILL.md"
  "$SP/policies/methodology.md"
  "$SP/policies/state_machine.md"
)

for f in "${required_files[@]}"; do
  [[ -f "$f" ]] || { echo "missing required file: $f"; exit 1; }
done

[[ -f "$PLATFORM_DOC" ]] || { echo "missing platform guide: $PLATFORM_DOC"; exit 1; }
[[ -f "$EXAMPLES_DOC" ]] || { echo "missing examples doc: $EXAMPLES_DOC"; exit 1; }
[[ -f "$AGENT_FILE" ]] || { echo "missing agent file: $AGENT_FILE"; exit 1; }
[[ -f "$PROJECT_AGENTS_FILE" ]] || { echo "missing project AGENTS.md: $PROJECT_AGENTS_FILE"; exit 1; }
[[ -d "$WORKFLOWS_DIR" ]] || { echo "missing workflows dir: $WORKFLOWS_DIR"; exit 1; }
[[ -f "$WORKFLOWS_DIR/hotfix.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/hotfix.md"; exit 1; }
[[ -f "$WORKFLOWS_DIR/worktree-first.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/worktree-first.md"; exit 1; }
[[ -f "$WORKFLOWS_DIR/new-feature.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/new-feature.md"; exit 1; }
[[ -f "$WORKFLOWS_DIR/medium-feature.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/medium-feature.md"; exit 1; }
[[ -f "$WORKFLOWS_DIR/docs-update.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/docs-update.md"; exit 1; }
[[ -f "$WORKFLOWS_DIR/hand-off.md" ]] || { echo "missing workflow: $WORKFLOWS_DIR/hand-off.md"; exit 1; }
[[ -d "$ROOT/.agents/skills" ]] || { echo "missing codex skills dir: $ROOT/.agents/skills"; exit 1; }
for skill_dir in "$ROOT"/.agent/skills/*; do
  skill_name="$(basename "$skill_dir")"
  [[ -L "$ROOT/.agents/skills/$skill_name" ]] || { echo "missing codex skill symlink: $ROOT/.agents/skills/$skill_name"; exit 1; }
  [[ -f "$skill_dir/agents/openai.yaml" ]] || { echo "missing skill metadata: $skill_dir/agents/openai.yaml"; exit 1; }
  rg -q "^display_name:" "$skill_dir/agents/openai.yaml" || { echo "skill metadata missing display_name: $skill_dir/agents/openai.yaml"; exit 1; }
  rg -q "^short_description:" "$skill_dir/agents/openai.yaml" || { echo "skill metadata missing short_description: $skill_dir/agents/openai.yaml"; exit 1; }
  rg -q "^icon_small:" "$skill_dir/agents/openai.yaml" || { echo "skill metadata missing icon_small: $skill_dir/agents/openai.yaml"; exit 1; }
done
[[ -f "$ROOT/.antigravity/rules.md" ]] || { echo "missing antigravity rules: $ROOT/.antigravity/rules.md"; exit 1; }
[[ -f "$ROOT/.agent/rules/rules.md" ]] || { echo "missing legacy rules copy: $ROOT/.agent/rules/rules.md"; exit 1; }
[[ -f "$CODEX_INSTALL" ]] || { echo "missing codex install doc: $CODEX_INSTALL"; exit 1; }
[[ -f "$CODEX_RULES" ]] || { echo "missing codex rules file: $CODEX_RULES"; exit 1; }

required_cmds=("/bootstrap" "/brainstorm" "/research" "/spec" "/plan" "/write-plan" "/implement" "/execute-plan" "/review" "/test" "/retro" "/handoff" "/ship")

for c in "${required_cmds[@]}"; do
  rg -q "^## ${c}$" "$SP/commands.md" || { echo "missing command section: $c"; exit 1; }
done

# Ensure README references implement module (not only old execute mapping)
if [[ -f "$ROOT/README.md" ]]; then
  rg -q "features/implement\.md" "$ROOT/README.md" || { echo "README does not reference implement.md"; exit 1; }
fi

rg -q "CODEX_PLATFORM_GUIDE\.md" "$AGENT_FILE" || { echo "AGENT.md does not reference CODEX_PLATFORM_GUIDE.md"; exit 1; }
rg -q "\.agent/skills" "$PROJECT_AGENTS_FILE" || { echo "AGENTS.md missing .agent/skills reference"; exit 1; }
rg -q "\.agents/skills" "$PROJECT_AGENTS_FILE" || { echo "AGENTS.md missing .agents/skills reference"; exit 1; }

if [[ -f "$ROOT/README.md" ]]; then
  rg -q "https://github.com/obra/superpowers" "$ROOT/README.md" || { echo "README missing superpowers reference URL"; exit 1; }
  rg -q "PROJECT_EXAMPLES\.md" "$ROOT/README.md" || { echo "README missing project examples link"; exit 1; }

fi

echo "superpowers validation passed"

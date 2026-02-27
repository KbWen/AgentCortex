#!/bin/bash
# AI Brain Deployer v3.5.0 (vNext Architecture Edition)

TARGET="${1:-.}"

if [ "$TARGET" == "--help" ] || [ "$TARGET" == "-h" ]; then
  echo "Usage: ./deploy_brain.sh <target_path>"
  echo ""
  echo "Options:"
  echo "  --force    Overwrite existing files (default: skip existing)"
  exit 0
fi

FORCE=false
if [ "$2" == "--force" ]; then
  FORCE=true
fi

CP_FLAG="-n"  # no-clobber by default (don't overwrite existing)
if [ "$FORCE" == true ]; then
  CP_FLAG=""
  echo "⚠️  Force mode: existing files will be overwritten."
fi

echo "🚀 Deploying AI Brain v3.5.0 (vNext Architecture Edition) to $TARGET..."

# ============================================================
# 1. Create vNext directory structure
# ============================================================
mkdir -p "$TARGET/.agent/rules"
mkdir -p "$TARGET/.agent/workflows"
mkdir -p "$TARGET/.agent/skills"
mkdir -p "$TARGET/.agent/superpowers/features"
mkdir -p "$TARGET/.agent/superpowers/policies"
mkdir -p "$TARGET/.github/ISSUE_TEMPLATE"
mkdir -p "$TARGET/docs/context/work"
mkdir -p "$TARGET/docs/context/archive"
mkdir -p "$TARGET/docs/specs"
mkdir -p "$TARGET/docs/adr"
mkdir -p "$TARGET/docs/guides"
mkdir -p "$TARGET/.codex"

# ============================================================
# 2. Deploy core governance files (cp -n = skip if exists)
# ============================================================
cp $CP_FLAG AGENTS.md "$TARGET/"
cp $CP_FLAG README.md "$TARGET/"
cp $CP_FLAG MODEL_GUIDE.md "$TARGET/"

# .agent core
cp $CP_FLAG .agent/rules/engineering_guardrails.md "$TARGET/.agent/rules/"
[ -f .agent/AGENT.md ] && cp $CP_FLAG .agent/AGENT.md "$TARGET/.agent/"

# vNext workflows (new)
for f in .agent/workflows/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/.agent/workflows/"
done

# Legacy superpowers (backward compat)
[ -f .agent/superpowers/commands.md ] && cp $CP_FLAG .agent/superpowers/commands.md "$TARGET/.agent/superpowers/"
[ -f .agent/superpowers/workflows.md ] && cp $CP_FLAG .agent/superpowers/workflows.md "$TARGET/.agent/superpowers/"
for f in .agent/superpowers/features/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/.agent/superpowers/features/"
done
for f in .agent/superpowers/policies/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/.agent/superpowers/policies/"
done
[ -f .agent/superpowers/validate.sh ] && cp $CP_FLAG .agent/superpowers/validate.sh "$TARGET/.agent/superpowers/" && chmod +x "$TARGET/.agent/superpowers/validate.sh"

# ============================================================
# 3. Deploy documentation
# ============================================================
# Context templates
cp $CP_FLAG docs/context/current_state.md "$TARGET/docs/context/"

# Guides
for f in docs/guides/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/guides/"
done

# ADR
for f in docs/adr/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/adr/"
done

# Reference docs
for f in docs/AGENT_PHILOSOPHY.md docs/TESTING_PROTOCOL.md docs/CODEX_PLATFORM_GUIDE.md docs/PROJECT_EXAMPLES.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/"
done

# GitHub templates
[ -f .github/ISSUE_TEMPLATE/agent_issue.md ] && cp $CP_FLAG .github/ISSUE_TEMPLATE/agent_issue.md "$TARGET/.github/ISSUE_TEMPLATE/"
[ -f .github/PULL_REQUEST_TEMPLATE.md ] && cp $CP_FLAG .github/PULL_REQUEST_TEMPLATE.md "$TARGET/.github/"

# Codex
[ -f .codex/INSTALL.md ] && cp $CP_FLAG .codex/INSTALL.md "$TARGET/.codex/"

# ============================================================
# 4. Ensure .gitkeep for empty dirs
# ============================================================
touch "$TARGET/docs/context/work/.gitkeep"
touch "$TARGET/docs/context/archive/.gitkeep"
touch "$TARGET/docs/specs/.gitkeep"

echo ""
echo "✅ AI Brain v3.5.0 (vNext Architecture Edition) deployed successfully!"
echo ""
echo "📦 Structure created:"
echo "   .agent/workflows/    ← vNext command workflows"
echo "   .agent/rules/        ← Engineering guardrails"
echo "   docs/context/        ← SSoT + work logs"
echo "   docs/specs/          ← AI-generated specifications"
echo "   docs/guides/         ← Token governance, migration guide"
echo ""
echo "💡 Next steps:"
echo "   1. Tell your AI: '請執行 /bootstrap' to start"
echo "   2. See docs/guides/migration.md for upgrade instructions"
echo "   3. Existing files were NOT overwritten (use --force to override)"

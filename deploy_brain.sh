#!/bin/bash
# AI Brain Deployer v3.5.1 (Full Platform Support Edition)

TARGET="${1:-.}"

if [ "$TARGET" == "--help" ] || [ "$TARGET" == "-h" ]; then
  echo "Usage: ./deploy_brain.sh <target_path> [--force]"
  echo ""
  echo "Options:"
  echo "  --force    Overwrite existing files (default: skip existing)"
  exit 0
fi

FORCE=false
if [ "$2" == "--force" ]; then
  FORCE=true
fi

CP_FLAG="-n"  # no-clobber by default
if [ "$FORCE" == true ]; then
  CP_FLAG=""
  echo "⚠️  Force mode: existing files will be overwritten."
fi

echo "🚀 Deploying AI Brain v3.5.1 (Full Platform Support) to $TARGET..."

# ============================================================
# 1. Create directory structure
# ============================================================
# Native Agent & vNext Structure
mkdir -p "$TARGET/.agent/rules"
mkdir -p "$TARGET/.agent/workflows"
mkdir -p "$TARGET/.agent/skills"
mkdir -p "$TARGET/.agent/superpowers/features"
mkdir -p "$TARGET/.agent/superpowers/policies"

# Platform Entry Points
mkdir -p "$TARGET/.antigravity"          # Google Antigravity
mkdir -p "$TARGET/codex/rules"           # Codex Web
mkdir -p "$TARGET/.agents/skills"        # Codex App (usually matches .agent)

# Git & Task Context
mkdir -p "$TARGET/.github/ISSUE_TEMPLATE"
mkdir -p "$TARGET/docs/context/work"
mkdir -p "$TARGET/docs/context/archive"
mkdir -p "$TARGET/docs/specs"
mkdir -p "$TARGET/docs/adr"
mkdir -p "$TARGET/docs/guides"
mkdir -p "$TARGET/.codex"

# ============================================================
# 2. Deploy core governance files
# ============================================================
# Entry points (plural AGENTS.md preferred for multi-platform)
cp $CP_FLAG AGENTS.md "$TARGET/"
cp $CP_FLAG README.md "$TARGET/"
cp $CP_FLAG MODEL_GUIDE.md "$TARGET/"

# Platform Rules
[ -d .antigravity ] && cp $CP_FLAG .antigravity/rules.md "$TARGET/.antigravity/"
[ -d codex ] && cp $CP_FLAG codex/rules/default.rules "$TARGET/codex/rules/"

# .agent core
cp $CP_FLAG .agent/rules/engineering_guardrails.md "$TARGET/.agent/rules/"
[ -f .agent/AGENT.md ] && cp $CP_FLAG .agent/AGENT.md "$TARGET/.agent/"

# ============================================================
# 3. Deploy vNext workflows
# ============================================================
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
# 4. Deploy documentation
# ============================================================
cp $CP_FLAG docs/context/current_state.md "$TARGET/docs/context/"
for f in docs/guides/*.md; do [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/guides/"; done
for f in docs/adr/*.md; do [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/adr/"; done
for f in docs/AGENT_PHILOSOPHY.md docs/TESTING_PROTOCOL.md docs/CODEX_PLATFORM_GUIDE.md docs/PROJECT_EXAMPLES.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/docs/"
done

# ============================================================
# 5. Symbolic links / Cross-Platform Skills
# ============================================================
# Ensure .agents/skills points to .agent/skills (if possible, or just copy)
# In many environments (Windows/Codex), we just ensure both exist
touch "$TARGET/.agent/skills/.gitkeep"
touch "$TARGET/.agents/skills/.gitkeep"

echo ""
echo "✅ AI Brain v3.5.1 deployed successfully!"
echo ""
echo "📦 Platform Entry Points Ready:"
echo "   .antigravity/rules.md  ← Google Antigravity"
echo "   codex/rules/           ← Codex Web/App"
echo "   AGENTS.md              ← Cross-platform entry"
echo ""
echo "💡 Next steps:"
echo "   1. Tell AI: '請執行 /bootstrap' to start"
echo "   2. Refer to docs/guides/migration.md for upgrades"

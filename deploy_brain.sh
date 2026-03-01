#!/bin/bash
# AI Brain Deployer v3.5.2 (Full Platform Support Edition)
...
echo "🚀 Deploying AI Brain v3.5.2 (Full Platform Support) to $TARGET..."

# ============================================================
# 1. Create directory structure
# ============================================================
# Native Agent & vNext Structure
mkdir -p "$TARGET/.agent/rules"
mkdir -p "$TARGET/.agent/workflows"
mkdir -p "$TARGET/.agent/skills"
mkdir -p "$TARGET/tools"

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

# ============================================================
# 3. Deploy vNext workflows
# ============================================================
for f in .agent/workflows/*.md; do
  [ -f "$f" ] && cp $CP_FLAG "$f" "$TARGET/.agent/workflows/"
done

# Tools & Validation
mkdir -p "$TARGET/tools"
[ -f tools/validate.sh ] && cp $CP_FLAG tools/validate.sh "$TARGET/tools/" && chmod +x "$TARGET/tools/validate.sh"
[ -f tools/audit_ai_paths.sh ] && cp $CP_FLAG tools/audit_ai_paths.sh "$TARGET/tools/" && chmod +x "$TARGET/tools/audit_ai_paths.sh"

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

# ============================================================
# 6. Update .gitignore
# ============================================================
GITIGNORE="$TARGET/.gitignore"
echo ""
echo "🔍 Checking .gitignore..."
if [ ! -f "$GITIGNORE" ]; then
    touch "$GITIGNORE"
fi

if ! grep -q "# AI Brain OS" "$GITIGNORE"; then
    echo "📝 Adding AI Brain OS patterns to .gitignore..."
    cat <<EOT >> "$GITIGNORE"

# AI Brain OS - Agent System & Local Context
.agent/
.agents/
.antigravity/
.codex/
codex/
AGENTS.md
MODEL_GUIDE.md
docs/context/
docs/context/private/
EOT
else
    echo "ℹ️ AI Brain OS patterns already present in .gitignore."
fi

echo ""
echo "✅ AI Brain v3.5.2 deployed successfully!"
echo ""
echo "📦 Platform Entry Points Ready:"
echo "   .antigravity/rules.md  ← Google Antigravity"
echo "   codex/rules/           ← Codex Web/App"
echo "   AGENTS.md              ← Cross-platform entry"
echo ""
echo "📝 Git Safety:"
echo "   AI-specific temporal files have been added to .gitignore."
echo ""
echo "💡 Next steps:"
echo "   1. Tell AI: 'Please run /bootstrap' to start"
echo "   2. Refer to docs/guides/migration.md for upgrades"

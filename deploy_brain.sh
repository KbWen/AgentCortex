#!/bin/bash
# AI Brain Deployer v3.4.0 (Antigravity Superpowers Edition)

TARGET="${1:-.}"

if [ "$TARGET" == "--help" ] || [ "$TARGET" == "-h" ]; then
  echo "Usage: ./deploy_brain.sh <target_path>"
  exit 0
fi

echo "🚀 Deploying AI Brain v3.4.0 (Antigravity Superpowers Edition) to $TARGET..."

# 1. Create structure
mkdir -p "$TARGET/.agent/rules"
mkdir -p "$TARGET/.agent/superpowers/features"
mkdir -p "$TARGET/.agent/superpowers/policies"
mkdir -p "$TARGET/.github/ISSUE_TEMPLATE"
mkdir -p "$TARGET/docs"

# 2. Deploy core files
cp .agent/AGENT.md "$TARGET/.agent/"
cp .agent/rules/engineering_guardrails.md "$TARGET/.agent/rules/"
cp .agent/superpowers/commands.md "$TARGET/.agent/superpowers/"
cp .agent/superpowers/workflows.md "$TARGET/.agent/superpowers/"
cp .agent/superpowers/features/*.md "$TARGET/.agent/superpowers/features/"
cp .agent/superpowers/policies/*.md "$TARGET/.agent/superpowers/policies/"
cp .agent/superpowers/validate.sh "$TARGET/.agent/superpowers/"
chmod +x "$TARGET/.agent/superpowers/validate.sh"
cp .github/ISSUE_TEMPLATE/agent_issue.md "$TARGET/.github/ISSUE_TEMPLATE/"
cp .github/PULL_REQUEST_TEMPLATE.md "$TARGET/.github/"
cp docs/AGENT_PHILOSOPHY.md "$TARGET/docs/"
cp docs/TESTING_PROTOCOL.md "$TARGET/docs/"
cp docs/CODEX_PLATFORM_GUIDE.md "$TARGET/docs/"
cp docs/PROJECT_EXAMPLES.md "$TARGET/docs/"
mkdir -p "$TARGET/.codex"
cp .codex/INSTALL.md "$TARGET/.codex/"
cp MODEL_GUIDE.md "$TARGET/"

echo "✅ AI Brain v3.4.0 (Antigravity Superpowers Edition) deployed successfully!"
echo "💡 Tip: Start with .agent/superpowers/commands.md for high-signal prompts."

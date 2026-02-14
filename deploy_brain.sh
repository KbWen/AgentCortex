#!/bin/bash
# AI Brain Deployer v3.1 (Agent-First Constitution)

TARGET="${1:-.}"

if [ "$TARGET" == "--help" ] || [ "$TARGET" == "-h" ]; then
  echo "Usage: ./deploy_brain.sh <target_path>"
  exit 0
fi

echo "🚀 Deploying AI Brain v3.1 (Agent-First Constitution) to $TARGET..."

# 1. Create Structure
mkdir -p "$TARGET/.agent/rules"
mkdir -p "$TARGET/.github/ISSUE_TEMPLATE"
mkdir -p "$TARGET/docs"

# 2. Deploy Core files
cp .agent/AGENT.md "$TARGET/.agent/"
cp .agent/rules/engineering_guardrails.md "$TARGET/.agent/rules/"
cp .github/ISSUE_TEMPLATE/agent_issue.md "$TARGET/.github/ISSUE_TEMPLATE/"
cp .github/PULL_REQUEST_TEMPLATE.md "$TARGET/.github/"
cp docs/AGENT_PHILOSOPHY.md "$TARGET/docs/"
cp docs/TESTING_PROTOCOL.md "$TARGET/docs/"
cp MODEL_GUIDE.md "$TARGET/"

echo "✅ AI Brain v3.1 (Agent-First Constitution) deployed successfully!"
echo "💡 Tip: Read docs/AGENT_PHILOSOPHY.md to understand the collaboration model."

#!/bin/bash
# AI Brain Deployer v3.0 (Pragmatic Lean Edition)
# Optimized for Google Antigravity & Token Efficiency

TARGET="${1:-.}"

if [ "$TARGET" == "--help" ] || [ "$TARGET" == "-h" ]; then
  echo "Usage: ./deploy_brain.sh <target_path>"
  echo "Example: ./deploy_brain.sh ./my-new-project"
  exit 0
fi

echo "🚀 Deploying AI Brain v3.0 to $TARGET..."

# 1. Create Structure
mkdir -p "$TARGET/.agent"

# 2. Deploy Core Prompt
if [ -f ".agent/AGENT.md" ]; then
  cp .agent/AGENT.md "$TARGET/.agent/"
else
  # Fallback if running from a context where .agent isn't sibling
  echo "⚠️  AGENT.md not found in current dir, skipping copy."
fi

# 3. Deploy Human Guide
if [ -f "MODEL_GUIDE.md" ]; then
  cp MODEL_GUIDE.md "$TARGET/"
fi

echo "✅ AI Brain v3.0 (Pragmatic Lean) deployed successfully!"
echo "📝 Action Required: Edit $TARGET/.agent/AGENT.md to fill in your project Tech Stack."
echo "💡 Tip: Always start your chat with Gemini 1.5 Flash for maximum efficiency."

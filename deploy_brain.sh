#!/bin/bash
# AI Brain Deployer v2.2

TARGET="$1"
MINIMAL="$2"

if [ -z "$TARGET" ]; then
  echo "Usage: ./deploy_brain.sh <target_path> [--minimal]"
  echo "  --minimal: Only deploy core Router, Architect, and Executor."
  exit 1
fi

mkdir -p "$TARGET/.agent/workflows"
mkdir -p "$TARGET/.agent/roles"
mkdir -p "$TARGET/.agent/skills"

# Core Files
cp .agent/00_meta_router.md "$TARGET/.agent/"
cp .agent/99_memory.md "$TARGET/.agent/"
cp .cursorrules "$TARGET/" 2>/dev/null || true

if [ "$MINIMAL" == "--minimal" ]; then
  echo "📦 Deploying MINIMAL Brain..."
  cp .agent/roles/architect.md "$TARGET/.agent/roles/"
  cp .agent/roles/executor.md "$TARGET/.agent/roles/"
  cp .agent/workflows/engineering_flow.md "$TARGET/.agent/workflows/"
else
  echo "🚀 Deploying FULL Brain v2.2..."
  cp -r .agent/workflows/* "$TARGET/.agent/workflows/"
  cp -r .agent/roles/* "$TARGET/.agent/roles/"
  cp -r .agent/skills/* "$TARGET/.agent/skills/"
fi

echo "✅ Personal AI OS v2.2 deployed to $TARGET"
echo "⚠️  Action Required: Update $TARGET/.agent/99_memory.md"

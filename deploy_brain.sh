#!/bin/bash
TARGET="$1"
if [ -z "$TARGET" ]; then echo "Usage: ./deploy_brain.sh <target_path>"; exit 1; fi
mkdir -p "$TARGET/.agent"
cp -r .agent/* "$TARGET/.agent/"
cp .cursorrules "$TARGET/" 2>/dev/null || true
echo "✅ AI Brain v2.1 (Optimized) deployed to $TARGET"
echo "⚠️  Ensure you update '99_memory.md' with your preferences."

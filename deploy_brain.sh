#!/bin/bash
TARGET="$1"
if [ -z "$TARGET" ]; then echo "❌ Usage: ./deploy_brain.sh <target_path>"; exit 1; fi

# 建立目錄
mkdir -p "$TARGET/.agent/rules"

# 複製規則
cp .agent/rules/*.md "$TARGET/.agent/rules/"

# 複製 Cursor 設定 (如果有)
if [ -f ".cursorrules" ]; then
    cp .cursorrules "$TARGET/"
fi

echo "✅ AI Brain deployed to $TARGET"
echo "⚠️  For Antigravity/Claude: Update your System Instructions from SYSTEM_INSTRUCTION.txt"
echo "⚠️  For Cursor: .cursorrules has been auto-deployed."

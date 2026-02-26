#!/usr/bin/env bash
set -euo pipefail

echo "=== AI Path Audit: $(pwd) ==="
echo

# ---------- Codex ----------
echo "== [Codex] Check repo root AGENTS.md =="
if [ -f "AGENTS.md" ]; then
  echo "✅ OK: ./AGENTS.md"
else
  echo "❌ MISSING: ./AGENTS.md  (Create one at repo root)"
fi
echo

echo "== [Codex] Check SKILL.md location (must be under .agents/skills/) =="
all_skill=$(find . -type f -name "SKILL.md" 2>/dev/null || true)
if [ -z "$all_skill" ]; then
  echo "ℹ️ No SKILL.md found (ok if you don't use Codex skills yet)"
else
  bad_skill=$(echo "$all_skill" | grep -vE '(^|/)\.agents/skills/|(^|/)\.agents/skills$' || true)
  if [ -n "$bad_skill" ]; then
    echo "❌ SKILL.md found outside .agents/skills/:"
    echo "$bad_skill" | sed 's/^/  - /'
  else
    echo "✅ OK: all SKILL.md under .agents/skills/"
  fi
fi
echo

echo "== [Codex] Suspicious: .agent/skills (likely wrong for Codex) =="
if [ -d ".agent/skills" ]; then
  echo "❌ Found .agent/skills/ (move to .agents/skills/)"
  find .agent/skills -maxdepth 4 -type f | sed 's/^/  - /'
else
  echo "✅ OK: no .agent/skills/"
fi
echo

# ---------- Antigravity ----------
echo "== [Antigravity] Check workspace rules/workflows (.agent/*) =="
if [ -d ".agent/rules" ]; then
  echo "✅ OK: ./.agent/rules/"
else
  echo "❌ MISSING: ./.agent/rules/"
fi
if [ -d ".agent/workflows" ]; then
  echo "✅ OK: ./.agent/workflows/"
else
  echo "❌ MISSING: ./.agent/workflows/"
fi
echo

echo "== [Antigravity] Suspicious: .agents/rules or .agents/workflows (likely wrong for Antigravity) =="
if [ -d ".agents/rules" ] || [ -d ".agents/workflows" ]; then
  echo "❌ Found Antigravity-like folders under .agents/:"
  [ -d ".agents/rules" ] && echo "  - .agents/rules"
  [ -d ".agents/workflows" ] && echo "  - .agents/workflows"
else
  echo "✅ OK: no .agents/rules or .agents/workflows"
fi
echo

echo "== [Antigravity] Check unrelated folders directly under .agent/ (only rules/ and workflows/ are allowed) =="
if [ -d ".agent" ]; then
  unrelated=$(find .agent -mindepth 1 -maxdepth 1 -type d \
    ! -name "rules" ! -name "workflows" 2>/dev/null || true)
  if [ -n "$unrelated" ]; then
    echo "❌ Unrelated folders under .agent/ (should be moved out):"
    echo "$unrelated" | sed 's/^/  - /'
  else
    echo "✅ OK: .agent/ only contains rules/ and workflows/"
  fi
else
  echo "ℹ️ .agent/ does not exist"
fi
echo

echo "== Suggested git mv commands (dry suggestions) =="
[ -d ".agents/rules" ] && echo "git mv .agents/rules .agent/rules"
[ -d ".agents/workflows" ] && echo "git mv .agents/workflows .agent/workflows"
[ -d ".agent/skills" ] && echo "git mv .agent/skills .agents/skills"
echo
echo "Done."

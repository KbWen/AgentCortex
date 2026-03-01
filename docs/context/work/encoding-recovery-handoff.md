# Encoding Recovery Handoff v3.5.3

> **Branch**: `feat/token-optimized-english`
> **Date**: 2026-03-01
> **Author**: Antigravity Pro Model (Audit)
> **Executor**: Flash Model or equivalent

---

## Root Cause

During the v3.5.2 English translation refactor, PowerShell `Get-Content` / `Set-Content` commands were used for text replacement. PowerShell's default encoding behavior silently corrupted UTF-8 byte sequences containing CJK characters and emoji, producing invalid byte sequences that fail `utf-8` decoding.

**24 files** were corrupted. **44 files** are clean.

---

## Recovery Strategy

Each broken file falls into one of two categories:

| Category | Description | Recovery Method |
|---|---|---|
| **A: Restore from `master`** | File exists on `master` with clean UTF-8. No intentional edits on this branch need preserving. | `git checkout master -- <path>` |
| **B: Restore from `master` + Re-apply English translation** | File exists on `master` with clean UTF-8, AND has intentional English translation edits from commit `3d147bd` that need to be re-applied. | `git checkout master -- <path>`, then manually re-apply the translation. |
| **C: Restore from commit `3d147bd`** | File only exists on this branch (not on `master`). | `git checkout 3d147bd -- <path>` |

---

## CRITICAL RULES

> [!CAUTION]
>
> 1. **NEVER use PowerShell `Set-Content` or `Get-Content` for file modification**. Always use Python with explicit `encoding='utf-8'` or the built-in file edit tools.
> 2. **Do NOT use `write_to_file` or `replace_file_content` on files that fail charset detection**. If the tool reports "failed to detect charset", you MUST first `rm -Force <file>` then `git checkout <ref> -- <path>` to restore a clean copy before editing.
> 3. After ALL restorations, run the validation script at the bottom of this document to confirm zero broken files remain.

---

## Category A: Restore Only (no translation needed)

These files should remain in **Traditional Chinese** (human-facing docs). Simply restore from `master`.

### Command (batch restore)

```powershell
git checkout master -- `
  MODEL_GUIDE.md `
  docs/AGENT_PHILOSOPHY.md `
  docs/CODEX_PLATFORM_GUIDE.md `
  docs/PROJECT_EXAMPLES.md `
  docs/TESTING_PROTOCOL.md `
  docs/guides/audit-guardrails.md `
  docs/guides/token-governance.md `
  .github/ISSUE_TEMPLATE/agent_issue.md `
  .github/PULL_REQUEST_TEMPLATE.md
```

### File list (9 files)

| # | File | Language | Notes |
|---|---|---|---|
| 1 | `MODEL_GUIDE.md` | 繁體中文 | Human-facing model selection guide |
| 2 | `docs/AGENT_PHILOSOPHY.md` | 繁體中文 | Human-facing philosophy doc |
| 3 | `docs/CODEX_PLATFORM_GUIDE.md` | 繁體中文 | Human-facing Codex guide |
| 4 | `docs/PROJECT_EXAMPLES.md` | 繁體中文 | Human-facing project examples |
| 5 | `docs/TESTING_PROTOCOL.md` | 繁體中文 | Human-facing testing protocol |
| 6 | `docs/guides/audit-guardrails.md` | 繁體中文 | Human-facing audit guide |
| 7 | `docs/guides/token-governance.md` | 繁體中文 | Human-facing token governance |
| 8 | `.github/ISSUE_TEMPLATE/agent_issue.md` | English | GitHub template (was already English on master) |
| 9 | `.github/PULL_REQUEST_TEMPLATE.md` | 繁體中文 | GitHub PR template |

---

## Category B: Restore + Re-apply English Translation

These are **AI-facing** files that were translated to English in commit `3d147bd`. The current branch versions are corrupted. You must:

1. First restore from `master` (clean Chinese version)
2. Then re-translate to English following the specifications below

### B1: `.agent/rules/rules.md`

**Restore**: `git checkout master -- .agent/rules/rules.md`

**Then overwrite** the entire file with this exact content:

```markdown
# Agent Rules — Redirect

> **Canonical rules have moved to `.antigravity/rules.md`.**
> This file exists only for legacy compatibility.
> AI agents: read `.antigravity/rules.md` instead. Do NOT duplicate rules here.
```

### B2: `.codex/rules/default.rules`

**Restore**: `git checkout master -- .codex/rules/default.rules`

**Then overwrite** the entire file with this exact content:

```text
# Codex default safety rules

prefix_rule("HIGH DESTRUCTIVE COMMANDS PROHIBITED (e.g., rm -rf, git reset --hard, clean -fdx, chmod -R 777, sudo curl | bash). If required, MUST provide risk assessment, rollback plan, and safe alternatives, then await explicit user authorization.")
prefix_rule("HIGH RISK SYSTEM COMMANDS PROHIBITED (e.g., docker system prune -a, chown -R). MUST use scoped alternatives (e.g., image prune) AND establish a verifiable rollback plan (backup path, revert commit) before execution.")
```

### B3: All 11 `.agents/skills/*/SKILL.md` files

**Restore all from `master`**:

```powershell
git checkout master -- `
  .agents/skills/dispatching-parallel-agents/SKILL.md `
  .agents/skills/executing-plans/SKILL.md `
  .agents/skills/finishing-a-development-branch/SKILL.md `
  .agents/skills/receiving-code-review/SKILL.md `
  .agents/skills/requesting-code-review/SKILL.md `
  .agents/skills/subagent-driven-development/SKILL.md `
  .agents/skills/systematic-debugging/SKILL.md `
  .agents/skills/test-driven-development/SKILL.md `
  .agents/skills/using-git-worktrees/SKILL.md `
  .agents/skills/verification-before-completion/SKILL.md `
  .agents/skills/writing-plans/SKILL.md
```

**Then translate each file** from Chinese to English following these rules:

1. **YAML frontmatter `description`**: Translate to concise English
2. **Markdown body**: Translate all Chinese text to professional English
3. **Keep structure**: Preserve all markdown formatting, headers, lists, code blocks
4. **Terminology**: Use standard software engineering terms (e.g., "rollback" not "回退", "evidence" not "證據")
5. **Do NOT edit the `name` field** in YAML frontmatter — it must remain the kebab-case identifier

Here is the mapping of each SKILL file's Chinese description → target English description:

| File | Chinese Description | Target English Description |
|---|---|---|
| `dispatching-parallel-agents` | 判斷是否值得啟用平行代理... | Evaluate when to dispatch parallel agents; use a 4-step pattern to split, coordinate, and integrate results. |
| `executing-plans` | 依既定計畫逐步執行與回報... | Execute plans step-by-step with evidence at each stage; maintain rollback capability. |
| `finishing-a-development-branch` | 在開發分支完成後執行最終驗證... | Perform final verification on development branches; choose from 4 merge strategies. |
| `receiving-code-review` | 有效接收 reviewer 意見... | Effectively process reviewer feedback; categorize blocking vs. advisory items. |
| `requesting-code-review` | 在適當時機請求 Code Review... | Request code reviews at the right time with necessary context and evidence. |
| `subagent-driven-development` | 透過子代理協作拆解任務... | Decompose tasks via subagent collaboration; define interface contracts and integration checkpoints. |
| `systematic-debugging` | 使用四階段根因分析... | Use 4-phase root cause analysis (Observe, Hypothesize, Verify, Fix); avoid unverified patches. |
| `test-driven-development` | 以測試先行... | Drive changes with Red→Green→Refactor; ensure behavior is verifiable and regression-safe. |
| `using-git-worktrees` | 使用 Git worktree 安全建立平行工作目錄... | Use Git worktrees to create parallel working directories safely; avoid branch-switch contamination. |
| `verification-before-completion` | 以「無證據不得宣稱完成」為鐵律... | Enforce "no evidence = no completion"; run Gate Function verification before declaring done. |
| `writing-plans` | 先規劃再實作... | Plan before implementing; produce verifiable, rollback-safe, incrementally executable task plans. |

---

## Category C: Restore from Translation Commit

These files only exist on this branch (not on `master`).

### C1: `docs/context/work/english-translation-audit-handoff.md`

**Restore**: `git checkout 3d147bd -- docs/context/work/english-translation-audit-handoff.md`

This is a work artifact from the translation session. After restoration, verify it reads correctly. No further edits needed.

### C2: `tools/validate.sh`

**Restore**: `git checkout 3d147bd -- tools/validate.sh`

After restoration, verify the script references are correct (no `.agent/superpowers/` paths — should reference `.agent/rules/` and `.agent/workflows/`).

---

## Post-Recovery Validation

After completing ALL fixes, run this Python validation script:

```python
# Save as C:/tmp/validate_encoding.py and run: python C:/tmp/validate_encoding.py
import os

root = '.'
exts = {'.md', '.sh', '.rules'}
skip = {'.git'}
broken = []

for dirpath, dirnames, filenames in os.walk(root):
    dirnames[:] = [d for d in dirnames if d not in skip]
    for f in filenames:
        _, ext = os.path.splitext(f)
        if ext not in exts:
            continue
        fp = os.path.join(dirpath, f)
        try:
            with open(fp, 'rb') as fh:
                fh.read().decode('utf-8')
        except UnicodeDecodeError:
            broken.append(fp)

if broken:
    print(f'FAIL: {len(broken)} files still broken:')
    for f in broken:
        print(f'  {f}')
else:
    print('PASS: All files are valid UTF-8.')
```

**Expected result**: `PASS: All files are valid UTF-8.`

---

## Final Commit

After all fixes pass validation:

```bash
git add -A
git commit -m "fix: restore 24 files corrupted by PowerShell encoding and re-apply English translations"
git push --force origin HEAD
```

---

## Summary Table

| Category | Count | Action |
|---|---|---|
| A: Restore only (Chinese) | 9 | `git checkout master --` |
| B: Restore + English translation | 13 | Restore then translate |
| C: Restore from branch commit | 2 | `git checkout 3d147bd --` |
| **Total** | **24** | |

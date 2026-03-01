# English Translation Audit & Superpowers Cleanup Handoff

> Branch: `feat/token-optimized-english`
> Date: 2026-03-01
> Author: Architecture Audit (Pro Model)
> Target: Flash Model Implementation

---

## Part A: Remaining English Translations

### A1: `.codex/INSTALL.md` ??Translate to English

- **Current**: Full Chinese (28 lines)
- **Action**: Translate entire file to English. The opening prompt block (lines 23-26) is especially critical as it gets pasted directly into AI chat.

### A2: `deploy_brain.sh` Line 121 ??Fix Chinese Prompt

- **Current**: `echo "   1. Tell AI: '請執?/bootstrap' to start"`
- **Fix**: `echo "   1. Tell AI: 'Please run /bootstrap' to start"`

---

## Part B: Superpowers Directory Cleanup (Two Steps)

### Step 1 ??Safe Delete (Zero Risk, No References)

Delete these files outright. Their content has been fully migrated to `.agent/workflows/*.md`:

| File to Delete | Reason |
|---|---|
| `.agent/superpowers/commands.md` | Migrated to `.agent/workflows/*.md`. File header itself says so. |
| `.agent/superpowers/workflows.md` | Migrated to `.agent/workflows/*.md`. File header itself says so. |
| `.agent/superpowers/features/bootstrap.md` | Replaced by `.agent/workflows/bootstrap.md` |
| `.agent/superpowers/features/brainstorm.md` | Replaced by `.agent/workflows/brainstorm.md` |
| `.agent/superpowers/features/execute.md` | Replaced by `.agent/workflows/execute-plan.md` |
| `.agent/superpowers/features/handoff.md` | Replaced by `.agent/workflows/handoff.md` |
| `.agent/superpowers/features/implement.md` | Replaced by `.agent/workflows/implement.md` |
| `.agent/superpowers/features/research.md` | Replaced by `.agent/workflows/research.md` |
| `.agent/superpowers/features/retro.md` | Replaced by `.agent/workflows/retro.md` |
| `.agent/superpowers/features/review.md` | Replaced by `.agent/workflows/review.md` |
| `.agent/superpowers/features/spec.md` | Replaced by `.agent/workflows/spec.md` |

After deleting above, also delete the now-empty directory: `.agent/superpowers/features/`

### Step 2 ??Migrate + Update References

#### 2a. Move `policies/` to `.agent/rules/`

```
.agent/rules/state_machine.md  ?? .agent/rules/state_machine.md
.agent/rules/methodology.md    ?? .agent/rules/methodology.md
```

Then delete empty dir: `.agent/rules/`

#### 2b. Move `validate.sh` to `tools/`

```
tools/validate.sh  ?? tools/validate.sh
```

#### 2c. Delete the now-empty `.agent/superpowers/` directory entirely

#### 2d. Update ALL References (Critical!)

Search and replace all paths across the project. Here is the exact list of files that need updating:

**Reference: `superpowers/policies/state_machine.md`**

| File | Line(s) | Old Path | New Path |
|---|---|---|---|
| `.agent/workflows/help.md` | ~12 | `.agent/rules/state_machine.md` | `.agent/rules/state_machine.md` |
| `docs/CODEX_PLATFORM_GUIDE.md` | ~24 | `.agent/rules/state_machine.md` | `.agent/rules/state_machine.md` |
| `docs/context/current_state.md` | ~12, ~26 | `.agent/rules/*.md` | `.agent/rules/*.md` |

**Reference: `superpowers/validate.sh`**

| File | Line(s) | Old Path | New Path |
|---|---|---|---|
| `README.md` | ~151 | `tools/validate.sh` | `tools/validate.sh` |
| `docs/CODEX_PLATFORM_GUIDE.md` | ~18, ~34 | `tools/validate.sh` | `tools/validate.sh` |
| `docs/PROJECT_EXAMPLES.md` | ~18, ~66, ~104 | `tools/validate.sh` | `tools/validate.sh` |

**Reference: `superpowers/` general mentions**

| File | Line(s) | Action |
|---|---|---|
| `README.md` | ~17 | Remove or update the deprecated notice about superpowers |
| `README.md` | ~37 | Update "Superpowers ?能對照" section heading |
| `.agent/workflows/superpowers-playbook.md` | ~35-37 | Remove the "Reference Paths" section pointing to superpowers |
| `tools/audit_ai_paths.sh` | ~89, ~92 | Remove `superpowers` from the allowed directories whitelist |

**Reference: `deploy_brain.sh` superpowers deployment**

| Lines | Action |
|---|---|
| 13-14 | Remove `mkdir` for superpowers directories |
| 52-61 | Remove entire "Legacy superpowers" copy block. Replace with: `[ -f tools/validate.sh ] && cp $CP_FLAG tools/validate.sh "$TARGET/tools/" && chmod +x "$TARGET/tools/validate.sh"` |

> [!IMPORTANT]
> Do NOT update files in `docs/context/archive/` or `CHANGELOG.md`. These are historical records and should remain unchanged.

---

## Part C: Verification

After all changes, run this check to confirm zero Chinese in AI-facing files:

```powershell
# PowerShell
Get-ChildItem -Recurse -Include *.md,*.rules,*.sh -Path .agent,.antigravity,.codex,codex,AGENTS.md,tools | Select-String -Pattern '[\u4e00-\u9fff]'
```

Expected result: **No matches** (?? archive 歷史檔??.

Also verify:

- `.agent/superpowers/` directory no longer exists
- `tools/validate.sh` exists and is executable
- `.agent/rules/state_machine.md` exists
- `.agent/rules/methodology.md` exists

---

## Commit Strategy

```
Commit 1: fix: translate remaining ai-facing files to english
  - .codex/INSTALL.md
  - deploy_brain.sh line 121

Commit 2: refactor: remove deprecated superpowers directory
  - Delete commands.md, workflows.md, features/
  - Migrate policies/ ??.agent/rules/
  - Migrate validate.sh ??tools/
  - Update all references
```


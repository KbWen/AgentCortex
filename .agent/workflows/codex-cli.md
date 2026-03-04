---
name: codex-cli
description: Run a task via Codex CLI while enforcing AgentCortex governance rules automatically.
tasks:
  - codex-cli
---

# /codex-cli

Dispatch a task to OpenAI Codex CLI while ensuring AgentCortex governance compliance.

> This workflow wraps `codex` CLI calls with automatic Work Log creation, classification, and evidence collection.

## Prerequisites

- Codex CLI installed: `npm install -g @openai/codex`
- API key configured: `OPENAI_API_KEY` set in environment

## 1. Usage

```text
/codex-cli <task description>
```

Or in natural language:

```text
用 Codex CLI 幫我 [task description]
Run this via Codex CLI: [task description]
```

## 2. AI Pre-Flight (Before Dispatching to Codex)

AI MUST perform these steps **before** invoking `codex`:

1. **Classify** the task per `engineering_guardrails.md` §10.1.
2. **Create/Update Work Log** at `docs/context/work/<branch-name>.md` with:
   - Classification, goal, target files, constraints.
   - `Executor: Codex CLI` (to distinguish from AI-direct execution).
3. **Generate the Codex prompt** by injecting governance context:

```text
codex --approval-mode suggest "
You are working in a project governed by AgentCortex.
RULES:
- Do NOT modify files outside the target list: [target files].
- Do NOT refactor code that was not requested.
- After changes, output a summary: files modified, what changed, what was NOT changed.
- If uncertain about scope, STOP and output your question instead of guessing.

TASK: [user's task description]
TARGET FILES: [from classification]
CONSTRAINTS: [from Work Log]
"
```

1. **Approval Mode**: Default to `suggest` (Codex proposes, human approves). Use `auto-edit` only if classification is `tiny-fix`.

| Classification | Codex `--approval-mode` |
| --- | --- |
| `tiny-fix` | `auto-edit` |
| `quick-win` | `suggest` |
| `feature` | `suggest` |
| `architecture-change` | ❌ Do NOT use Codex CLI. Too complex. |
| `hotfix` | `suggest` |

## 3. AI Post-Flight (After Codex Completes)

AI MUST perform these steps **after** Codex returns:

1. **Verify scope**: Check `git diff` — did Codex modify files outside the target list?
   - If yes: revert unauthorized changes, log in Work Log, warn user.
2. **Collect evidence**: Capture Codex's output summary and append to Work Log.
3. **Run tests** if applicable: `npm test` / `pytest -q` / project-specific test command.
4. **Update Work Log** with:
   - Codex execution result (success/partial/failure).
   - Files actually modified.
   - Test results.
5. **Gate check**: Apply the standard gate for the classification tier (see §10.2).

## 4. Example Session

```text
User: /codex-cli Fix the typo in README.md line 42, "recieve" → "receive"

AI:
  Classification: tiny-fix
  Work Log: skipped (tiny-fix)
  Codex approval mode: auto-edit

  Running: codex --approval-mode auto-edit "Fix typo in README.md line 42: recieve → receive. Do NOT modify anything else."

  Result: ✅ README.md modified. 1 line changed.
  Evidence: diff shows only the typo fix. No other files touched.
  Done.
```

```text
User: 用 Codex CLI 幫我把 utils/format.ts 的 formatDate 函數加上 locale 參數

AI:
  Classification: quick-win (1 file, clear scope)
  Work Log: docs/context/work/main.md (Executor: Codex CLI)
  Codex approval mode: suggest

  Running: codex --approval-mode suggest "
  AgentCortex rules: only modify utils/format.ts. No refactoring.
  Task: Add locale parameter to formatDate function.
  Constraint: Preserve existing behavior when locale is not provided (default to current behavior).
  "

  Codex proposes:
    [shows diff]
  
  User: approve
  
  Result: ✅ utils/format.ts modified.
  Test: npm test → all pass.
  Evidence appended to Work Log.
```

## 5. Error Handling

| Error | AI Action |
| --- | --- |
| Codex not installed | Output: `npm install -g @openai/codex` and stop |
| API key missing | Output: set `OPENAI_API_KEY` and stop |
| Codex modified wrong files | Auto-revert, log violation, warn user |
| Codex output unclear | AI reviews diff manually, applies standard review |
| Task too complex for Codex | Reject and suggest direct AI implementation |

## 6. Guardrails Integration

- All AgentCortex rules in `engineering_guardrails.md` apply to Codex-generated code.
- Codex is treated as a **Junior Tool** — its output ALWAYS gets AI review before being accepted.
- The AI is the governance layer; Codex is the execution layer.

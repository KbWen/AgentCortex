---
name: handoff
description: Cross-turn handoff summary & hard reference checks.
tasks:
  - handoff
---

# /handoff

Read-only logic. DOES NOT change state. Hard completion gate for non-`tiny-fix` tasks.

> Canonical gate: `Ref: .agent/superpowers/policies/state_machine.md`

## 1. Trigger Conditions

- Non-`tiny-fix`: MUST execute before pause, end, or handoff.
- `tiny-fix`: Exempt, but MUST retain minimal evidence.

## 2. Platform Specialization

- **Codex Web**: MUST output full summary directly in chat.
- **Antigravity / Codex App**: Auto-write to `docs/context/work/<branch-name>.md`.

## 3. Required Output Blocks

- **Done**
- **In Progress**
- **Blockers**
- **Next**
- **Risks**
- **References**

## 4. Minimum References (HARD GATE)

MUST include ALL of the following:

1. ≥1 `docs/` file path
2. ≥1 code file path
3. Corresponding Work Log path (`docs/context/work/<branch-name>.md`)

If requirements unsatisfied, COMPLETION AND `/ship` ARE STRICTLY PROHIBITED.

## 5. Token & Efficiency Reflection

If task was abnormally long or consumed high tokens, briefly explain why (e.g., "ambiguous specs", "bug loop"). Aids in continuous governance optimization.

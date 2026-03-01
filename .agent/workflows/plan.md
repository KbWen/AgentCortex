---
name: plan
description: Outputs actionable plan & enforces quality gates. Transitions state to IMPLEMENTABLE.
tasks:
  - plan
---

# /plan

> Canonical state & transitions: `Ref: .agent/rules/state_machine.md`

NO CODING YET. Planning phase ONLY.

## Expected Output Format

1. Target Files
2. Execution Steps (2-10 min granularity)
3. Risks & Rollback Strategy
4. Acceptance Criteria Coverage
5. Non-goals

## Quality Gates (ALL MUST PASS)

- Every AC MUST map to ?? step.
- Step granularity: Module/File/Function level.
- MUST identify ?? Risk + viable Rollback.
- List ONLY files being modified (Prevent scope creep).
- MUST explicitly cite documentation (e.g., `Ref: docs/specs/auth.md`).

## Token Budget Checkpoint

- Plan MUST include `Mode: Normal` or `Mode: Fast Lane`.
- If task is small but output balloons, MUST switch to `Fast Lane` using summarization next turn.
- Detailed rules: `Ref: docs/guides/token-governance.md`.

## State Transition

- Upon passing gates, state transitions from `PLANNED` to `IMPLEMENTABLE`.
- Automatically offer `/test-skeleton` in the same turn.


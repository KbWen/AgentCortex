# Token Governance Guide

## Objective

To continuously reduce average task token costs without sacrificing correctness or traceability.

## 0. Spirit of Architecture (No Token-Saving at the Expense of Correctness)

Lowering token usage must maintain the "Engineering Constitution":

- **Correctness first**: No evidence, no completion. Do not claim completion just to save tokens.
- **Document-first**: Architecture or core logic changes must have corresponding Spec/ADR before summarization.
- **Traceability floor**: Any summary must retain a traceable path (at least doc + code + work log).

> Quick check: If a "token-saving technique" makes AC alignment, risk rollback, or test evidence disappear, the technique is disallowed.

## 1. Task-Level Token Budget (Preliminary)

- `tiny-fix`: Recommended 1–2 turns to complete.
- `behavior-change`: Recommended 2–4 turns to complete.
- `feature` / `architecture-change`: Recommended 3–6 turns to complete.

> Turn counts are upper-limit reminders, not hard failure conditions.

## 2. Mandatory Indicators (Minimal Set)

Every non-`tiny-fix` task should include `Token Notes` in its work log:

1. Interaction turn count.
2. Whether repetitive explanation occurred (Y/N).
3. Whether the Fast Lane or summarization strategy was hit (Y/N).

## 3. Budget Overflow Handling (Cost Fallback)

If a small task (docs-update / small-fix) exceeds the budget:

1. Force use of `Mode: Fast Lane` for the next turn.
2. Switch response format to a fixed template (Summary + Evidence + Next), prohibiting lengthy background restatement.
3. Retain only essential references and AC alignment; do not repeat large sections of specification text.

## 4. Anti-Degradation Rules

- If a "small job results in excessive tokens," the root cause must be recorded in the `/retro` or work log.
- Use the verified short template for future tasks of the same type.

## 5. Relation to Process Documents

- `/plan` should include `Mode: Normal` or `Mode: Fast Lane`.
- `/handoff` should keep each block concise, avoiding full diffs.
- `/ship` should provide only necessary evidence, avoiding repetitive narratives.

## 6. Full Checklist (Post-Release Audit)

When a new version claims to "reduce token consumption for document reading," at least check:

1. **Precision Reading**: Whether SSoT guidance is followed, avoiding blind scans of `docs/`.
2. **Process Integrity**: Whether state machines and quality gates are still followed, avoiding skipping steps for summarization.
3. **Evidence Density**: Whether validate/test/command evidence is still provided.
4. **Rollback Mechanism**: Whether files can still be located and rollbacked quickly after compressed output.
5. **Cross-Platform Consistency**: Whether Web/App/Antigravity specifications remain consistent.

If any check fails, it is considered "breaking governance for efficiency" and must be corrected before success is declared.

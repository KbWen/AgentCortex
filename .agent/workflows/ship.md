---
name: ship
description: Final delivery and archival. Requires TESTED state and handoff gate.
tasks:
  - ship
---

# /ship

> Canonical gate: `Ref: .agent/rules/state_machine.md`

## Entry Conditions (HARD)

1. Current state is `TESTED`.
2. Non-`tiny-fix` tasks MUST have completed `/handoff`.
3. `/handoff` References MUST meet minimums (doc + code + work log).

If ANY condition fails, MUST reject `/ship` and output missing list.

## Output Format

- Commit message (Conventional Commits)
- Change summary (bullet points)
- Test results (Evidence)
- Doc sync status (Did `current_state.md` update?)
- Known risks and rollback strategy

## State Update & Archival

1. Update `docs/context/current_state.md` based on classification (ONLY during `/ship`).
2. Archive `docs/context/work/<branch-name>.md` to `docs/context/archive/` (if task complete).
    - Before archiving: Extract ALL bullets from the Work Log's `## Lessons` block (max 3 total).
    - Append these bullets to the `## Global Lessons` section in `current_state.md`.
    - If there is no `## Global Lessons` section in `current_state.md`, create one at the bottom.
3. Freeze Artifacts: Ensure all produced Specs/ADRs have YAML frontmatter `status: frozen`. If missing, add it before commit.

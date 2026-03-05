---
name: ship
description: Final delivery and archival. Requires TESTED state and handoff gate.
tasks:
  - ship
---

# /ship

> Canonical gate: `Ref: .agent/rules/state_machine.md`

## Gate Engine (Turn 1 — Antigravity Hard Path)

Before ANY ship action, output the Minimal Gate Block:

```yaml
gate: ship
classification: <from Work Log>
branch: <current branch>
checks:
  worklog_exists: yes|no
  spec_exists: yes|no|na
  state_ok: yes|no
  handoff_ok: yes|no|na
verdict: pass|fail
missing: []
```

- If `verdict: fail` → output ONLY the gate block. STOP.
- If classification is `feature` or `architecture-change`:
  - Output: "Gate passed. Reply **PROCEED-SHIP** to continue."
  - STOP until user replies.
- `quick-win` / `hotfix`: proceed directly after gate pass.

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

1. **Ship Guard (§11.3)**: Before writing, check if `current_state.md` has been modified since this task started. If modified by another session, warn user and request confirmation before merging. Use **additive merge**, never full overwrite.
2. **SSoT Update & Ship History**:
   - Update `docs/context/current_state.md` Spec Index statuses (mutable snapshot).
   - MUST append the completion record to the bottom of the file under `## Ship History`.
   - Use the format:

     ```markdown
     ### Ship-<branch_name>-<YYYY-MM-DD>
     - Feature shipped: [summary]
     - Tests: Pass
     ```

   - NEVER edit, reorder, or delete previous entries in the `## Ship History`.
3. Archive `docs/context/work/<branch-name>.md` to `docs/context/archive/` (if task complete).
    - Before archiving: Extract ALL bullets from the Work Log's `## Lessons` block (max 3 total).
    - Append these bullets to the `## Global Lessons` section in `current_state.md`.
    - If there is no `## Global Lessons` section in `current_state.md`, create one at the bottom.
4. Freeze Artifacts: Ensure all produced Specs/ADRs have YAML frontmatter `status: frozen`. If missing, add it before commit.
   - **Spec Freshness**: If implementation DIFFERS from any referenced spec's AC, MUST update the spec to match actual behavior before freezing. Append `[Updated: <date>]` to the corresponding Spec Index entry in `current_state.md`.

---
description: Workflow for implement
---
# /implement

> Hard Gate: state >= `IMPLEMENTABLE` (Plan quality gate MUST be passed).

## Pre-Execution Check (Mandatory)

Before ANY code change, AI MUST:

1. Read the `## Non-goals` section of the Spec referenced in this task's Work Log.
2. Confirm the current implementation step does NOT touch any Non-goal item.
3. If a step would require touching a Non-goal, STOP and surface: "⚠️ Step [N] conflicts with Non-goal: [item]. Proceed? (yes/no)"
4. IF Work Log contains a `Recommended Skills` entry: READ those SKILL.md files now before writing any code.
   - Explicitly state: "Applying [skill-name] strategy for this implementation."

Execute the approved plan. STRICTLY restricted to modifying ONLY the listed target files.

## Mid-Execution Guard

- **Classification Escalation**: If actual changes exceed the classification threshold (e.g., `quick-win` touching >2 modules or adding new directories), AI MUST pause and remind: "⚠️ Scope has grown beyond `[current-tier]`. Recommend escalating to `[higher-tier]` to activate Spec/Handoff gates. Escalate? (yes/no)"

Post-Execution Report:

- Summary of actual changes
- Potential side-effects
- Suggested verification/test commands
- **Scope Divergence Check**: Compare actual modified files against planned target files. If extra files were touched, flag: "⚠️ Scope divergence: planned [N] files, touched [M] files. Extra: [list]. Confirm these are intentional? (yes/revert)"

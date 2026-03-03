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

Execute the approved plan. STRICTLY restricted to modifying ONLY the listed target files.

Post-Execution Report:

- Summary of actual changes
- Potential side-effects
- Suggested verification/test commands

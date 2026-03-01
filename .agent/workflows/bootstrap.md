---
name: bootstrap
description: Task initialization, context loading, classification, and work log creation.
tasks:
  - bootstrap
---

# /bootstrap

> Canonical state & transitions: `Ref: .agent/rules/state_machine.md`

## 1. Initialization & Required Reading

1. READ `docs/context/current_state.md` (SSoT).
2. READ/CREATE `docs/context/work/<branch-name>.md` (Work Log).
3. IF `docs/context/private/` exists, SCAN for local-only instructions (e.g., private Git workflows, environment-specific configs). These files are gitignored and contain context that should NOT be committed.
4. **Migration/Integration Scenario**:
   - Follow `docs/guides/migration.md`. Actively scan and suggest file reorganization.
   - MUST output migration plan and await user `OK` before ANY move/rename.
5. **Large Raw Material Processing** (Chats, Whitepapers, Specs):
   - AI MUST autonomously extract requirements, constraints, and ACs.
   - Save structured output to `docs/specs/<feature-name>.md`.
   - Burden of organization is on the AI, NOT the user.
6. Classify task per `engineering_guardrails.md`.

Classification Tiers:

- `tiny-fix`
- `behavior-change`
- `feature`
- `architecture-change`
- `hotfix`

## 2. Work Log Header Setup

Write to `docs/context/work/<branch-name>.md`:

- `Classification`: [Tier]
- `Classified by`: [AI Name]
- `Frozen`: true
- `Created Date`: [Date]

## 3. Expected Output Format

1. Classification (with justification)
2. Goal
3. Paths
4. Constraints & AC
5. Non-goals

## 4. Hard Checkpoints

- Classification is FROZEN once written to Work Log.
- `tiny-fix` bypasses full bootstrap/handoff overhead, but MUST provide evidence.

## 5. Hard Gate

- MUST CREATE `docs/context/work/<branch-name>.md` before proceeding.
- If file already exists, READ and RESUME from existing state.

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
   - **Cross-Branch Awareness**: Check "Branch List" for recently closed branches.
   - If current task overlaps with a recently merged branch's module, AI MUST scan `docs/context/archive/` of that branch to check for spec changes or relevant Lessons.
2. READ/CREATE `docs/context/work/<branch-name>.md` (Work Log).
   - If Work Log exists and has `## Resume` block: treat as RESUME. Read `## Resume` first, then output "Resuming from: [State]".
   - If Work Log has `## Lessons` block (from prior retro): acknowledge relevant patterns in your bootstrap output.
   - If Work Log has `## Risks` block: include in your bootstrap context summary.
2a. SPEC SCOPE: From the **Spec Index** in `current_state.md`, identify which specs are relevant to this task.
   - Read ONLY those specs. Do NOT open specs not listed in the Spec Index entry for this task.
   - Also check `current_state.md` Spec Index for any `[MERGE-PROPOSED]` tags on relevant specs. If found, surface to user BEFORE starting work: "⚠️ Spec consolidation was recommended for [files]. Proceed as-is or consolidate first?"
   - If uncertain, ask ONE clarifying question before reading any spec.
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

- `tiny-fix` — No overhead. Directly execute.
- `quick-win` — Light overhead. Plan → Execute → Evidence. No Spec/Handoff.
- `feature` — Standard flow. Full bootstrap gates required.
- `architecture-change` — Heavy flow. ADR + migration plan required.
- `hotfix` — Urgent path. Systematic debug → fix → retro.

## 2. Work Log Header Setup

Write to `docs/context/work/<branch-name>.md`:

- `Classification`: [Tier]
- `Classified by`: [AI Name]
- `Frozen`: true
- `Created Date`: [Date]
- `Recommended Skills`: [skill-name (reason)] | none — *(determined from available skill summaries, no file read required. Skip for `tiny-fix`.)*

## 3. Expected Output Format

1. Classification (with justification)
2. Goal
3. Paths
4. Constraints & AC
5. Non-goals
6. Recommended Skills: Based on task type, select 0-2 skills from the available skill summaries already in context. Write chosen skills (with one-line reason) to Work Log. **Skip for `tiny-fix`.** No file reads required at this stage.
7. Context Read Receipt: MUST output:
   - `current_state.md` → [last modified date or key field you read]
   - Work Log → [status: existing|created|resumed]
   - Spec Scope → [list of determined-relevant spec files, or "none"]

## 4. Hard Checkpoints

- Classification is FROZEN once written to Work Log.
- `tiny-fix` bypasses full bootstrap/handoff overhead, but MUST provide evidence.
- `quick-win` bypasses Spec and Handoff, but MUST provide a brief plan and diff evidence.

## 5. Hard Gate

- MUST CREATE `docs/context/work/<branch-name>.md` before proceeding.
- If file already exists, READ and RESUME from existing state.

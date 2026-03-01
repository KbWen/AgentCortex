# Engineering Guardrails (Constitution)

## Scope

Global (applies to all projects using template).

## Role

Non-negotiable principles for agent-driven development.

## 1. Core Philosophy

### 1.1 Correctness First

- Correctness > Performance/Complexity/Features.
- Unverifiable behavior is classified as UNSAFE.

### 1.2 Explicit Over Implicit

- Assumptions, preconditions, limitations MUST be explicitly stated.
- Implicit magic behavior is PROHIBITED.

### 1.3 Reproducibility by Default

- Same input MUST yield same output.
- Randomness MUST be controllable, toggleable, and traceable.

## 2. Change Safety Principles

### 2.1 Small & Reversible Changes

- Micro-patches preferred.
- Rollback MUST be designed upfront.

### 2.2 Preserve Existing Behavior

- DO NOT alter existing semantics unless explicitly requested.
- New behavior MUST be feature-flagged or config-driven.

## 3. Data & Time Integrity

- Look-ahead bias PROHIBITED.
- Exact temporal ordering MUST be stated.
- Input -> Output causality MUST be clear.

## 4. Design Before Implementation

- BEFORE coding, MUST provide: Problem understanding, Design, Trade-offs, Risks.
- If ambiguous, priority is CLARIFICATION.

## 5. Testing & Verification

- Logic Change -> Add Test.
- Interface Change -> Verify Compatibility.
- **Sanity Check**: Is output bounding safe? Side-effects?
- **Doc-First Pillar**: Architecture/Core logic changes MUST precede with Spec/ADR in `docs/`.
- **Naming/Locations**:
  - ADRs: `docs/adr/ADR-[ID]-[kebab-case].md`
  - Specs: `docs/specs/[feature-name].md`
  - Guides: `docs/guides/[topic].md`
  - Agent Scratch: `.agent/scratch/`

## 6. Explainability & Traceability

- Big decisions MUST be traceable ("Why was this done?").
- Intermediate results and Decision Traces prioritized.

## 7. Scope Discipline

- ONLY solve requested issue. UNAUTHORIZED REFACTORING IS PROHIBITED.
- If larger issue discovered, output a "Follow-up Issue" recommendation.

## 8. Agent Operating Mode

- **Default**: Conservative, Explainable, Stable.
- **When Uncertain**: State ambiguity, provide 2-3 options, DEFER high-impact decisions to user.

## 10. vNext Governance & Classification

### 10.1 Escalation Rules

| Trigger Condition | Minimum Classification |
| --- | --- |
| Touches `exports` / public API / signature | `behavior-change` |
| Touches >1 module import graph | `feature` |
| Adds new directories | `feature` |
| Alters data-flow / system boundaries | `architecture-change` |
| Alters default configs impacting users | `behavior-change` |

### 10.2 Gate Type & Evidence Standards

| Category | Mandatory Gates | Min Evidence Required |
| --- | --- | --- |
| **tiny-fix** | classify -> plan (inline) -> execute | diff summary + 1-line verification |
| **behavior-change** | bootstrap -> spec -> plan -> review -> regression test -> handoff | before/after behavior + test output |
| **feature** | bootstrap -> spec -> plan -> review -> test -> handoff | test output + verifiable demo steps |
| **architecture-change** | bootstrap -> ADR -> spec -> plan -> migration/rollback -> handoff | migration plan + rollback verification |
| **hotfix** | systematic debug -> evidence -> fix -> retro -> handoff | root cause + fix verification + retro |

### 10.3 Tiny-Fix Fast-Path

- **Definition**: Modifies < 3 files WITHOUT semantic change (typo, docs, non-functional config).
- **Flow**: `classify -> one-line scope -> execute -> inline evidence -> done`.
- **Exclusion**: Bypasses full `/bootstrap`, `/handoff`, and Work Log overhead.

### 10.4 Handoff/Ship Hard Gate

- Non-`tiny-fix` tasks MUST NOT claim complete without `/handoff`.
- `/ship` MUST verify handoff references:
  1. ≥1 `docs/` file path
  2. ≥1 code path
  3. Work log path
- If missing, AI MUST reject `/ship` and list missing artifacts.

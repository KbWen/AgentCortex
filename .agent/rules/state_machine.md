# Canonical Development State Machine

## Defined States

`INIT` -> `BOOTSTRAPPED` -> `CLASSIFIED` -> [`SPECIFIED`] -> `PLANNED` -> `IMPLEMENTABLE` -> `IMPLEMENTING` -> `REVIEWED` -> `TESTED` -> `SHIPPED`

## Allowed Transitions

- `INIT` --(`/bootstrap`)--> `BOOTSTRAPPED`
- `BOOTSTRAPPED` --(`/classify` or via bootstrap)--> `CLASSIFIED`
- `CLASSIFIED` --(`/research` | `/brainstorm`)--> `CLASSIFIED`
- `CLASSIFIED` --(`/spec` with `docs/specs/` artifact)--> `SPECIFIED`
- `SPECIFIED` --(`/plan`)--> `PLANNED`
- `CLASSIFIED` --(`/plan`)--> `PLANNED`  [ONLY for: `tiny-fix`, `quick-win`, `hotfix`]
- `PLANNED` --(gate pass)--> `IMPLEMENTABLE`
- `IMPLEMENTABLE` --(`/implement` | `/execute-plan`)--> `IMPLEMENTING`
- `IMPLEMENTING` --(`/review` pass)--> `REVIEWED`
- `REVIEWED` --(`/test` pass)--> `TESTED`
- `TESTED` --(`/ship`)--> `SHIPPED`

## Spec Gate (Hard)

- Classifications `feature` and `architecture-change` MUST reach `SPECIFIED` before `/plan`.
- `SPECIFIED` requires a corresponding `docs/specs/<feature>.md` artifact with `status: draft` or `status: frozen`.
- `tiny-fix`, `quick-win`, and `hotfix` may transition directly from `CLASSIFIED` to `PLANNED`.

## Read-Only Commands (No State Change)

- `/help`, `/commands`, `/test-skeleton`, `/handoff`

## Hard Gates

- Non-`tiny-fix` tasks MUST execute `/handoff` before `SHIPPED`. Required references:
  1. ✅ `docs/` artifact path
  2. ✅ modified code path
  3. Active work log path
- `tiny-fix` allows fast-path but MUST provide minimal evidence (diff + one-line verification).

## Legacy State Mapping (Migration)

- `SPEC_READY` -> `SPECIFIED`
- `PLAN_READY` -> `IMPLEMENTABLE`
- `IN_PROGRESS` -> `IMPLEMENTING`
- `UNDER_REVIEW` -> `REVIEWED`
- `DONE` -> `SHIPPED` (Requires test & ship gates)

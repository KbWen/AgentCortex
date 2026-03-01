# Canonical Development State Machine

## Defined States

`INIT` -> `BOOTSTRAPPED` -> `CLASSIFIED` -> `PLANNED` -> `IMPLEMENTABLE` -> `IMPLEMENTING` -> `REVIEWED` -> `TESTED` -> `SHIPPED`

## Allowed Transitions

- `INIT` --(`/bootstrap`)--> `BOOTSTRAPPED`
- `BOOTSTRAPPED` --(`/classify` or via bootstrap)--> `CLASSIFIED`
- `CLASSIFIED` --(`/spec` | `/research` | `/brainstorm`)--> `CLASSIFIED`
- `CLASSIFIED` --(`/plan`)--> `PLANNED`
- `PLANNED` --(gate pass)--> `IMPLEMENTABLE`
- `IMPLEMENTABLE` --(`/implement` | `/execute-plan`)--> `IMPLEMENTING`
- `IMPLEMENTING` --(`/review` pass)--> `REVIEWED`
- `REVIEWED` --(`/test` pass)--> `TESTED`
- `TESTED` --(`/ship`)--> `SHIPPED`

## Read-Only Commands (No State Change)

- `/help`, `/commands`, `/test-skeleton`, `/handoff`

## Hard Gates

- Non-`tiny-fix` tasks MUST execute `/handoff` before `SHIPPED`. Required references:
  1. ✅ `docs/` artifact path
  2. ✅ modified code path
  3. Active work log path
- `tiny-fix` allows fast-path but MUST provide minimal evidence (diff + one-line verification).

## Legacy State Mapping (Migration)

- `SPEC_READY` -> `CLASSIFIED`
- `PLAN_READY` -> `IMPLEMENTABLE`
- `IN_PROGRESS` -> `IMPLEMENTING`
- `UNDER_REVIEW` -> `REVIEWED`
- `DONE` -> `SHIPPED` (Requires test & ship gates)

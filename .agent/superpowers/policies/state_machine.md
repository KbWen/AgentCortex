# Development State Machine (Canonical)

## States

- `INIT`
- `BOOTSTRAPPED`
- `CLASSIFIED`
- `PLANNED`
- `IMPLEMENTABLE`
- `IMPLEMENTING`
- `REVIEWED`
- `TESTED`
- `SHIPPED`

## Allowed Transitions

- `INIT` --(`/bootstrap`)--> `BOOTSTRAPPED`
- `BOOTSTRAPPED` --(`/classify` or bootstrap output includes classify)--> `CLASSIFIED`
- `CLASSIFIED` --(`/spec` or `/research` or `/brainstorm`)--> `CLASSIFIED`
- `CLASSIFIED` --(`/plan`)--> `PLANNED`
- `PLANNED` --(plan quality gate pass)--> `IMPLEMENTABLE`
- `IMPLEMENTABLE` --(`/implement` or `/execute-plan`)--> `IMPLEMENTING`
- `IMPLEMENTING` --(`/review` pass)--> `REVIEWED`
- `REVIEWED` --(`/test` pass)--> `TESTED`
- `TESTED` --(`/ship`)--> `SHIPPED`

## Read-Only Commands (No State Change)

- `/help`
- `/commands`
- `/test-skeleton`
- `/handoff`

## Gate Notes

- 非 `tiny-fix` 任務在 `SHIPPED` 前必須完成 `/handoff`，且 references 要求：
  1) 至少一個 `docs/` 文件
  2) 至少一個 code path
  3) 對應 work log 路徑
- `tiny-fix` 可走 fast-path，但仍需提供最小證據（diff + one-line verification）。

## Legacy Mapping (Migration Aid)

- `SPEC_READY` -> `CLASSIFIED`
- `PLAN_READY` -> `IMPLEMENTABLE`
- `IN_PROGRESS` -> `IMPLEMENTING`
- `UNDER_REVIEW` -> `REVIEWED`
- `DONE` -> `SHIPPED`（需滿足 test + ship gates）

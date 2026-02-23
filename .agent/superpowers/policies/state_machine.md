# Development State Machine

## States

- `INIT`
- `SPEC_READY`
- `PLAN_READY`
- `IN_PROGRESS`
- `UNDER_REVIEW`
- `DONE`

## Transitions

- `INIT` --(/bootstrap,/brainstorm,/spec)--> `SPEC_READY`
- `SPEC_READY` --(/plan or /write-plan)--> `PLAN_READY`
- `PLAN_READY` --(/implement or /execute-plan)--> `IN_PROGRESS`
- `IN_PROGRESS` --(/review)--> `UNDER_REVIEW`
- `UNDER_REVIEW` --(critical issues)--> `IN_PROGRESS`
- `UNDER_REVIEW` --(/test pass + no critical)--> `DONE`

## Completion Rule

只有在 `DONE` 且具備可驗證證據（測試結果 + review 結論）時，才可 /ship。

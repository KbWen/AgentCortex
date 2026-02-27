# Codex 平台使用指南（Web / App）

## 適用範圍

本模板同時適用：
- Codex Web 版
- Codex App（桌面版）

## 統一狀態機（兩平台共用）

請以 canonical state machine 為準：
`Ref: .agent/superpowers/policies/state_machine.md`

- `/help`、`/commands`、`/test-skeleton`、`/handoff` 為唯讀狀態指令。
- `/ship` 僅允許在 `TESTED` 後執行。

## 共用建議

1. 任務開場先提供：目標、目標檔案、限制、驗收標準。
2. 先跑 `/bootstrap`、再 `/plan`，通過 quality gate 才 `/implement`。
3. 每次實作後跑 `/review` 與 `/test`。
4. 提交前跑 `./.agent/superpowers/validate.sh`。

## Handoff Hard Gate（非 tiny-fix）

在 `/ship` 之前，必須先有 `/handoff`，且 References 最低要求：
1. 至少 1 個 `docs/` 文件。
2. 至少 1 個 code file path。
3. 對應 work log：`docs/context/work/<branch-name>.md`。

若不滿足，必須拒絕 `/ship` 並列出缺失。

## Web 版建議

- 一個需求一個 thread，避免上下文污染。
- 長任務中斷前務必輸出 `/handoff`，並提醒人類保存。

## App 版建議

- 使用本地 repo 執行 `deploy_brain.sh` 與驗證腳本。
- 每次子目標完成即更新 work log，降低跨天重建成本。

## 快速檢查清單

- [ ] `/bootstrap` 已完成
- [ ] `/plan` 已通過 quality gate
- [ ] `/implement` 在 `IMPLEMENTABLE` 才執行
- [ ] `/review` 與 `/test` 已完成
- [ ] 非 `tiny-fix` 已完成 `/handoff`
- [ ] `validate.sh` 已通過

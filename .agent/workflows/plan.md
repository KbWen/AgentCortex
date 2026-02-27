---
name: plan
description: 輸出可執行規劃與 quality gate，通過後進入 implementable。
tasks:
  - plan
---

# /plan

> Canonical state & transitions: `Ref: .agent/superpowers/policies/state_machine.md`

先規劃，不寫程式。

## 輸出格式

1. 目標檔案
2. 修改步驟（2–10 分鐘單位）
3. 風險與回退策略
4. 驗收標準（AC coverage）
5. 非目標

## Quality Gate（全部必須通過）

- 每條 AC 至少對應一個步驟。
- 步驟粒度為模組/檔案/完整函式。
- 至少一個風險點與對應 rollback。
- 僅列會變更的檔案，避免 scope creep。
- 必須明確引用文件（例如 `Ref: docs/specs/auth.md`）。

## Token Budget Checkpoint

- 規劃需附 `Mode: Normal` 或 `Mode: Fast Lane`。
- 若是小任務但輸出過長，下一輪需切 `Fast Lane` 並改用摘要化模板。
- 詳細規則：`Ref: docs/guides/token-governance.md`。

## 通過後

- 狀態可從 `PLANNED` 進入 `IMPLEMENTABLE`。
- 同回合自動提供 `/test-skeleton`。

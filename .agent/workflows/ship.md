---
name: ship
description: 最終交付與歸檔，需滿足 tested 與 handoff gate。
tasks:
  - ship
---

# /ship

> Canonical gate: `Ref: .agent/superpowers/policies/state_machine.md`

## 進入條件（硬性）

1. 當前狀態為 `TESTED`。
2. 非 `tiny-fix` 任務必須已有 `/handoff`。
3. `/handoff` 的 References 必須滿足最小要求（doc + code + work log）。

若任一條件不滿足，必須拒絕 `/ship` 並回覆缺失清單。

## 輸出格式

- Commit message（Conventional Commits）
- 變更摘要（條列）
- 測試結果（Evidence）
- 文檔同步狀態（含是否更新 `current_state.md`）
- 已知風險與回退方式

## 狀態更新與歸檔

1. 依分類決策更新 `docs/context/current_state.md`（僅 `/ship` 階段）。
2. 歸檔 `docs/context/work/<branch-name>.md` 至 `docs/context/archive/`（若任務已完成）。

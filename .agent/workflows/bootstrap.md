---
name: bootstrap
description: 任務啟動與分類，建立 work log 並凍結分類。
tasks:
  - bootstrap
---

# /bootstrap

> Canonical state & transitions: `Ref: .agent/superpowers/policies/state_machine.md`

## 1. 任務啟動與必要讀取

1. 先讀 `docs/context/current_state.md`（SSoT）。
2. 讀取 `docs/context/work/<branch-name>.md`（若不存在則建立）。
3. **若使用者提供大量原始素材**（對話記錄、規格書、白皮書、技術文件等）：
   - AI 自行從素材中提取：需求、限制、驗收標準。
   - 將結構化內容整理存入 `docs/specs/<feature-name>.md`。
   - 使用者**不需要**事先整理文件，整理是 AI 的責任。
4. 依 `engineering_guardrails.md` 進行任務分類。

分類：

- `tiny-fix`
- `behavior-change`
- `feature`
- `architecture-change`
- `hotfix`

## 2. 建立/更新 Work Log

在 `docs/context/work/<branch-name>.md` 寫入標頭：

- `Classification`
- `Classified by`
- `Frozen: true`
- `Created Date`

## 3. 輸出格式

1. Classification（含理由）
2. Goal
3. Paths
4. Constraints & AC
5. Non-goals

## 4. 檢查點

- 分類一經寫入 Work Log 即凍結。
- `tiny-fix` 可略過完整 bootstrap/handoff，但不得略過 evidence。

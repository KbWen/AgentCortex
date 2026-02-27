---
name: handoff
description: 跨回合交接摘要與 references 硬性檢查。
tasks:
  - handoff
---

# /handoff

唯讀狀態指令：不變更狀態，但為非 `tiny-fix` 的硬性完成閘門。

> Canonical gate: `Ref: .agent/superpowers/policies/state_machine.md`

## 1. 執行時機

- 非 `tiny-fix` 任務：每次暫停、結束、交接前都必須執行。
- `tiny-fix`：可豁免，但仍需保留最小 evidence。

## 2. 平台特化

- **Codex Web**：摘要需完整輸出於對話框。
- **Antigravity / Codex App**：同步寫入 `docs/context/work/<branch-name>.md`。

## 3. 輸出區塊（必填）

- **Done**
- **In Progress**
- **Blockers**
- **Next**
- **Risks**
- **References**

## 4. References 最低要求（硬性）

必須同時包含：
1. ≥1 個 `docs/` 文件路徑。
2. ≥1 個 code file path。
3. 對應 Work Log 路徑（`docs/context/work/<branch-name>.md`）。

未達最低要求時，禁止宣告完成與 `/ship`。

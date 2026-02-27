# /handoff

## 1. 執行時機

每一手 Agent 在結束或暫停前必須執行，`tiny-fix` 除外。

## 2. 平台特化 (Platform Specialization)

- **Codex Web**: 必須將摘要完整「印在對話框」中，並提示人類保存。
- **Antigravity / Codex App**: 直接將摘要更新至 `docs/context/work/<branch-name>.md`。

## 3. 輸出區塊 (必填)

- **Done**: 已完成的具體變更。
- **In Progress**: 進行中但未完成的部分。
- **Blockers**: 阻礙進度的因素。
- **Next**: 接手 Agent 應執行的下一步。
- **Risks**: 已知風險與回退方案。
- **References**: 本次任務相關的 `docs/` 連結、ADR 或 Context 檔案路徑。

> [!TIP]
> **Token Optimization**: 每區塊建議不超過 5 個 bullet points，禁止複製粘貼完整代碼 diff。

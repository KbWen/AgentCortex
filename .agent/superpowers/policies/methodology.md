# Superpowers Methodology Policy（Antigravity / Codex）

## 核心原則（Mandatory）

1. **Spec before code**：先 Brainstorm/Spec，再 Plan，再 Implement。
2. **Evidence over claims**：未提供測試與檢查證據，不得宣告完成。
3. **TDD preferred / enforced on logic changes**：邏輯變更優先 RED→GREEN→REFACTOR。
4. **Review as gate**：Critical 問題存在時，流程退回實作階段。
5. **Small reversible tasks**：任務拆為 2–5 分鐘可完成單位。

## 平台適配

- Google Antigravity：偏向指令卡驅動（/bootstrap → /plan → /implement）。
- Codex Web/App：支援別名流程（/write-plan = /plan，/execute-plan = /implement）。

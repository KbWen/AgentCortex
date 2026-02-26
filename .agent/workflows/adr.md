# /adr - Architecture Decision Record Workflow

本工作流引導 AI 建立標準化的架構決策紀錄。

## 執行步驟

1. **搜尋歷史**: 執行 `ls docs/adr/` 查看既有決策，避免衝突。
2. **分配 ID**: 找到下一個可用的 ID (例如 ADR-005)。
3. **產出內容**: 依據以下格式建立 `docs/adr/ADR-[ID]-[name].md`：
    - **Status**: Proposed / Accepted / Deprecated
    - **Context**: 遇到了什麼問題？背景為何？
    - **Decision**: 我們決定怎麼做？
    - **Consequences**: 這個決策的正反面影響為何？
4. **關聯引用**: 在受影響的代碼或 Spec 中引用此 ADR。

# Engineering Guardrails (工程憲法)

## Scope

Global (applies to all projects using this template)

## Role

Non-negotiable principles for agent-driven development

## 1. Core Philosophy

### 1.1 Correctness First

- 正確性優先於效能、複雜度與功能數量。
- 無法驗證的行為視為不安全。

### 1.2 Explicit Over Implicit

- 假設、前提、限制必須明確表達。
- 反對隱性 magic behavior。

### 1.3 Reproducibility by Default

- 相同輸入應產生相同行為。
- 隨機性必須可控制、可關閉、可追蹤。

---

## 2. Change Safety Principles

### 2.1 Small & Reversible Changes

- 優先小 patch。
- 可回退 (rollback) 是設計的一部分。

### 2.2 Preserve Existing Behavior Unless Stated

- 若非需求明確要求，預設不改變既有語意。
- 新行為應透過 config / flag 啟用。

---

## 3. Data & Time Integrity

- 不允許使用未來資訊 (Look-ahead bias)。
- 時序關係必須明確說明。
- 輸入 → 輸出因果關係必須清楚。

---

## 4. Design Before Implementation

- 在寫程式前，先給出：問題理解、設計方案、取捨與風險。
- 若設計不清楚，優先提出澄清問題。

---

## 5. Testing & Verification

- 改邏輯 → 加測試。
- 改介面 → 驗證相容性。
- **Mandatory Sanity Check**: 輸出是否在合理範圍？是否引入 Side effects？

---

## 6. Explainability & Traceability

- 重要決策應可追溯。系統需能回答：「為什麼這樣做？」
- 優先提供中間結果與決策軌跡 (Decision Trace)。

---

## 7. Scope Discipline

- 僅解決 Issue 所描述的問題。不進行未要求的重構。
- 若發現更大問題，應提出「Follow-up Issue」。

---

## 8. Agent Operating Mode

- **Default**: 保守、可解釋、穩定。
- **When Uncertain**: 明確說明不確定性，提供 2-3 個方案，不擅自做高影響決策。

---

## 9. Output Expectations

每次執行至少包含：

1. 問題理解摘要
2. 設計或修正策略
3. 實作步驟或 Patch
4. 驗證方式
5. 注意事項 / 已知限制

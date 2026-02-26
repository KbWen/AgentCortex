---
name: receiving-code-review
description: 有效接收 reviewer 意見，分類處理阻斷與建議項，避免來回失焦。
---

# Receiving Code Review（接收程式碼審查）

## 概述

Review 回饋需要結構化處理，才能快速收斂到可合併狀態。

## 回饋分類

- **Blocking**：必修，影響正確性/安全/穩定性。
- **Non-blocking**：可後續處理的可讀性或優化建議。
- **Question**：需補上下文或設計說明。

## 回應流程

1. 逐條回覆，避免遺漏。
2. 變更後重新執行相關測試。
3. 回報「修正內容 + 驗證證據 + 未採納理由（若有）」。


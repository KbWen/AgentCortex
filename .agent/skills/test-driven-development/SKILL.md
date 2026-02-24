---
name: test-driven-development
description: 以測試先行（Red→Green→Refactor）方式推進邏輯變更，確保行為可驗證且可回歸。
---

# Test-Driven Development（測試驅動開發）

## 概述

TDD 透過 **Red → Green → Refactor** 小循環，先定義預期行為，再用最小實作讓測試通過，最後整理程式結構。

## 使用時機

- 新增或修改核心邏輯。
- 修復 bug 並需要防回歸保障。
- 需求可寫成明確輸入/輸出驗收。

## 流程

1. **Red**：先寫失敗測試，描述期待行為。
2. **Green**：以最小程式碼讓測試通過。
3. **Refactor**：整理命名、結構與重複。
4. 重複循環直到 AC 滿足。

## 鐵律

- 不可先寫大量功能再補測試。
- 每個循環只處理一個小目標。
- Refactor 後必須全測試通過。


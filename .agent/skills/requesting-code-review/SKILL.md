---
name: requesting-code-review
description: 在適當時機請求 Code Review，並提供可快速審查的必要上下文與證據。
---

# Requesting Code Review（請求程式碼審查）

## 概述

Code Review 是品質閘門，不是形式流程。高品質的 review request 可大幅縮短回合數並降低上線風險。

## 何時請求 Review

- 完成一個可獨立驗收的變更集。
- 涉及安全、權限、資料一致性、核心邏輯。
- 即將合併到主分支或準備發版。

## 送審前準備

1. 提供變更摘要（為何改、改了什麼、沒改什麼）。
2. 附上驗證證據（測試命令與結果）。
3. 標示風險與回退方案。
4. 說明 reviewer 應聚焦區域。

## Review 請求模板

- **Context**：需求背景與目標。
- **Scope**：影響檔案與邊界。
- **Validation**：執行過的測試與結果。
- **Risks**：潛在副作用與 mitigation。
- **Questions**：希望 reviewer 重點檢查的問題。

## 常見錯誤

- 丟一個巨大 diff 且沒有摘要。
- 未提供任何驗證輸出。
- 把「可讀性建議」與「阻斷問題」混在一起。

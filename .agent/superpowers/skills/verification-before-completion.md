---
name: verification-before-completion
description: 以「無證據不得宣稱完成」為鐵律，在宣告完成前執行 Gate Function 驗證。
---

# Verification Before Completion（完成前驗證）

## 概述

任何「已完成」聲明都必須可被證據支持。這個技能提供一個完成前 Gate Function，確保結果可重現、可追溯、可交付。

## 鐵律

- **無證據不得宣稱完成（No evidence, no completion claim）**。
- 證據需能被他人重跑，不接受口頭描述取代。
- 測試/檢查失敗時，狀態必須回到 in-progress。

## 使用時機

- 任務準備進入 `/ship`。
- 需要提交 PR 或交接前。
- 高風險改動（資料、權限、核心流程）完成後。

## Gate Function（完成閘門）

1. **Scope Gate**：確認變更只涵蓋已同意範圍。
2. **Quality Gate**：執行必要測試與靜態檢查。
3. **Evidence Gate**：整理可重現證據（指令、輸出、版本）。
4. **Risk Gate**：確認回退策略與已知風險。
5. **Communication Gate**：輸出完成摘要（變更、驗證、限制）。

## 最低證據清單

- 至少一組與本次改動直接相關的測試/檢查。
- 具體執行命令與結果（成功/失敗/警告）。
- 如有未完成項，需明確標示與後續處理建議。

## 常見錯誤

- 僅說「應該可用」但無任何輸出證據。
- 測試只跑 happy path，缺回歸或邊界案例。
- 把舊測試結果當成新變更證據。

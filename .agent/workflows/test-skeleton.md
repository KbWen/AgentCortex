---
name: test-skeleton
description: 唯讀產出測試藍圖，不含實作程式碼。
tasks:
  - test-skeleton
---

# /test-skeleton

唯讀指令，不改變狀態。

> Canonical state & transition: `Ref: .agent/superpowers/policies/state_machine.md`

請先產出 Test Skeleton（不寫實作程式碼）。

規則：
1. 每條 AC 至少一個測試。
2. 每個風險點至少一個回歸或防呆測試。
3. 每個測試需包含：測試名稱、目的、測試類型、前置條件/資料、驗證方式。

啟用條件：
- `/plan` 已通過 quality gate（state >= `PLANNED`）。
- 若 gate 未通過，必須拒絕並指出缺失。

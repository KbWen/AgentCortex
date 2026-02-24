---
name: new-feature
description: 新功能探索流程，先發散再收斂，最後以可驗證方式落地。
tasks:
  - brainstorm
  - spec
  - plan
  - implement
  - review
  - test
---

# New Feature Workflow

1. `/brainstorm`：至少提出 3 個方案並比較取捨與風險。
2. `/spec`：確認 AC、Non-goals、資料契約與邊界。
3. `/plan`：列出目標檔案、風險、驗證方式與回退方案。
4. `/implement`：依計畫小步實作，避免未授權重構。
5. `/review`：檢查副作用、相容性與安全風險。
6. `/test`：執行最小必要測試並記錄可重現命令。

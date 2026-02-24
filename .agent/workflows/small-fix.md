---
name: small-fix
description: 小型修補流程，適用影響範圍小於 3 個檔案且需快速可回退的修正。
tasks:
  - plan
  - implement
  - review
  - test
---

# Small Fix Workflow

1. `/plan`：確認影響範圍（< 3 檔）、驗收標準、風險與回退方案。
2. `/implement`：採最小變更小步實作，避免順手重構。
3. `/review`：聚焦副作用、相容性與是否可快速回退。
4. `/test`：執行單檔或最小必要測試集合並記錄結果。

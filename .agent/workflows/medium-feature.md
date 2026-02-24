---
name: medium-feature
description: 中型功能流程，適用跨模組或需要分 phase 驗收的需求。
tasks:
  - research
  - spec
  - plan
  - implement
  - review
  - test
---

# Medium Feature Workflow

1. `/research`：先收斂未知項與相依限制。
2. `/spec`：固定介面、模組邊界與相容策略。
3. `/plan`：拆成 Phase 1/2，確保每個階段可獨立驗收與回退。
4. `/implement`：按 phase 實作並維持小步提交。
5. `/review`：聚焦跨模組影響與整合風險。
6. `/test`：執行跨模組測試與關鍵回歸驗證。

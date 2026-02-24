---
name: hotfix
description: 緊急修復流程，先找根因再做最小修補。
tasks:
  - research
  - plan
  - implement
  - review
  - test
---

# Hotfix Workflow

1. `/research`：界定 root cause 與 blast radius。
2. 使用 `skills/systematic-debugging`：依「觀察→假設→驗證→修復」收斂根因。
3. `/plan`：定義最小改動、風險與回退。
4. `/implement`：執行最小修補。
5. `/review`：補齊替代方案與取捨。
6. `/test`：重現案例 + 回歸案例。

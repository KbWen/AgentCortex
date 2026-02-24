---
name: handoff
description: 跨 Agent / 人類交接流程，降低重工並保留決策脈絡。
tasks:
  - handoff
  - bootstrap
  - plan
---

# Handoff Workflow

1. `/handoff`：輸出 Done / In Progress / Blockers / Next / Risks。
2. 接手方執行 `/bootstrap`：重建目標、限制、AC 與上下文假設。
3. 接著執行 `/plan`：確認續作範圍、驗證方式與回退點，避免重工。

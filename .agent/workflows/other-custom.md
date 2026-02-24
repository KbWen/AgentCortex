---
name: other-custom
description: 其他常見自訂流程（治理與品質守門），可依情境套用分支治理與 TDD Gate。
tasks:
  - plan
  - implement
  - review
  - test
  - retro
---

# Other Custom Workflow

1. `/plan`：確認此任務不屬於既有流程時的目標、限制、風險與回退策略。
2. 分支治理：必要時套用 `skills/using-git-worktrees/SKILL.md` 先建立安全 worktree，再執行開發。
3. TDD Gate：若有邏輯變更，先 RED（失敗測試）→ GREEN（最小實作）→ REFACTOR（保持綠燈）。
4. `/implement`：依計畫實作並維持可回退的小步提交。
5. `/review` + `/test`：檢查副作用與關鍵回歸，保留可重現命令。
6. `/retro`：紀錄本次自訂流程是否可抽象為新 workflow card。

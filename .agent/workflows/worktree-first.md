---
name: worktree-first
description: 以 Git worktree 為優先的分支與工作目錄治理流程。
tasks:
  - using-git-worktrees
  - plan
  - implement
  - review
  - finishing-a-development-branch
---

# Worktree-first Workflow

1. 先套用 `skills/using-git-worktrees` 建立獨立工作目錄。
2. 在新 worktree 執行 `/plan`，明確變更範圍。
3. `/implement`：於 worktree 內完成實作與提交。
4. `/review` + `/test`：確認無副作用。
5. 以 `skills/finishing-a-development-branch` 收尾：Merge / PR / Keep / Archive。

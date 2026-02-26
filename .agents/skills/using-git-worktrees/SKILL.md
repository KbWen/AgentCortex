---
name: using-git-worktrees
description: 使用 Git worktree 安全建立平行工作目錄，避免分支切換污染並提升多任務效率。
---

# Using Git Worktrees（使用 Git Worktree）

## 概述

Git worktree 允許同一個 repository 同時掛載多個工作目錄，各自對應不同分支，適合並行開發與 hotfix。

## 目錄選擇原則

- 以 repo 外層或專用資料夾集中管理（例如 `../wt-<task>`）。
- 命名包含任務語意（feature/hotfix + 短名稱）。
- 避免與既有工作區混淆或覆蓋。

## 安全性檢查

1. 確認主工作區乾淨（避免未提交變更被誤帶走）。
2. 先列出既有 worktree：`git worktree list`。
3. 檢查目標目錄不存在或為空。
4. 確認分支命名與追蹤策略。

## 建立流程

1. 建立分支並新增 worktree：
   - `git worktree add ../wt-<task> -b <branch-name>`
2. 切入新目錄後執行 baseline 測試。
3. 在該目錄獨立開發、提交、驗證。
4. 完工後移除 worktree（若不再需要）：
   - `git worktree remove ../wt-<task>`

## 常見錯誤

- 在錯誤 worktree 提交。
- 刪除 worktree 但分支仍需保留卻未確認。
- 目錄命名混亂，導致任務對應不清。

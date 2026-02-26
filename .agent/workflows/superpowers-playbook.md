---
name: superpowers-playbook
description: Antigravity 可直接讀取的綜合流程卡，統一新功能、小修補、中型功能、Hotfix 與交接情境。
tasks:
  - bootstrap
  - classify
  - spec
  - plan
  - implement
  - review
  - test
  - handoff
---

# Superpowers Playbook Workflow

## 適用情境

- 新功能
- 小型修補
- 中型功能
- 緊急修復（Hotfix）
- 跨 Agent / 人類交接

## 執行順序

1. `/bootstrap`：定義 Goal / Paths / Constraints / AC / Non-goals。
2. 任務分類：依風險與影響判定（文件更新 / 小修補 / 中型功能 / 新功能 / 緊急修復）。
3. `/spec`（若需要）：固化 AC、邊界與非目標。
4. `/plan`：列目標檔案、驗證方式、風險與回退。
5. `/implement`：按計畫小步修改，避免未授權擴充。
6. `/review`：檢查副作用、相容性與安全性。
7. `/test`：執行可重現命令並保留結果。
8. `/handoff`：輸出 Done / In Progress / Blockers / Next / Risks。

## 路徑對照

- 指令模板：`.agent/superpowers/commands.md`
- 詳細流程指南：`.agent/superpowers/workflows.md`
- 任務型 workflow cards：`.agent/workflows/*.md`

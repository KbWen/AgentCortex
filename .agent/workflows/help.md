---
name: help
description: 唯讀顯示目前狀態、可用指令與下一步建議。
tasks:
  - help
---

# /help

唯讀指令，不改變狀態。

> Canonical state list: `Ref: .agent/superpowers/policies/state_machine.md`

輸出內容：
1. Current State
2. 任務類型（若已判定）
3. 目前可用指令（依 State 過濾）
4. 全指令一覽與用途
5. 下一步建議（不自動執行）

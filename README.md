# Personal AI OS v2.4 (極致節流與模型分級版)

## 🎯 核心價值

這是一個針對 **Google Antigravity / Claude** 優化的 AI Agent 框架。透過 **Workflow (工作流)**、**Role (角色)**、**Rule (規則)** 與 **Skill (技能)** 的解耦，實現自動化的「模型分級策略」，有效節省 Token 並提升輸出穩定性。

## 🚀 3 分鐘快速上手

1. **部署**: 執行 `./deploy_brain.sh <目標專案路徑>`。
2. **記憶設定**: 編輯 `.agent/99_memory.md`，填入技術棧與 `MAX_TOKEN_FLASH` 閾值。
3. **系統指令**: 將 `SYSTEM_INSTRUCTION.txt` 內容貼入 AI 的系統提示詞中。

## 🏗️ 目錄結構與擴充指南

```text
.agent/
├── 00_meta_router.md       # 決策中心：判斷任務並選擇 Flash 或 Pro 模型
├── 99_memory.md            # 個人化記憶：紀錄技術棧、偏好與 Token 閾值
├── rules/                  # 行為規範 (如：翻譯標準、搜尋規範) -> 優先使用
├── workflows/              # 複雜流程 (如：Bug 調查、長文摘要) -> 多階執行
├── roles/                  # 思維人格 (如：建築師、審查官) -> 用於決策
└── skills/                 # 能力資產 (如：SEO、格式化報表) -> 重複調用
```

### 如何新增功能？

- **想規範行為？** -> 在 `rules/` 新增檔案。
- **需要新思維？** -> 在 `roles/` 新增人格。
- **複雜多步驟？** -> 在 `workflows/` 定義流程。

## ⚖️ 模型智慧策略

- **Flash 模式**: 處理單一檔案修改、翻譯、簡單查詢。
- **Pro 模式**: 處理跨檔案重構、根因分析、創意寫作。
- **多階執行**: 對於長篇任務，系統會先由 Flash 提取重點，再由 Pro 整合輸出，節省成本。

## 🛠️ 支援平台

- **Google IDX / Antigravity**
- **Cursor** (.cursorrules)
- **Claude Projects**
- **VS Code Extension**

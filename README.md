# AI Brain OS v3.1 (Agent-First Constitution)
>
> **不僅是工具，更是一套 AI 與人類協作的立憲架構。**

## 🎯 專案定位

v3.1 在 v3.0 的「極簡省錢」基礎上，引入了**憲法層級 (Constitution Layer)**。這是一套專為 **AI Agent + 專業工程師** 打造的 Repo 模板。

## 🚀 核心規範

1. **工程憲法 (`.agent/rules/engineering_guardrails.md`)**: Agent 執行任務時不可違背的底線（正確性優先、顯性假設、可逆變動）。
2. **Issue 驅動開發 (`.github/ISSUE_TEMPLATE/`)**: 結構化的需求單，讓 Agent 一讀就通，減少溝通成本。
3. **協作哲學 (`docs/AGENT_PHILOSOPHY.md`)**: 定義 Agent 為「數位協作者」，明確責任邊界。

## 🏗️ 快速上手 (Google Antigravity)

1. **部署**: `./deploy_brain.sh .` (將核心檔案複製到您的專案)。
2. **遵守憲法**: 在對話啟動時，Agent 會自動讀取 `.agent/AGENT.md` 並遵循工程憲法。
3. **結構化任務**: 推薦使用 GitHub Issue 的模板來描述複雜任務，Agent 會處理得更精準。

## ⚖️ 模型策略 (Flash-First)

| 任務 | 推薦模型 | 說明 |
| :--- | :--- | :--- |
| **80% 日常** | **Gemini 1.5 Flash** | 翻譯、修復簡單 Bug、執行 Patch、單檔測試。 |
| **20% 關鍵** | **Claude 3.5 Sonnet / Pro** | 架構設計、大規模重構、核心邏輯審閱。 |

---
詳細變更請見 [CHANGELOG.md](./CHANGELOG.md)

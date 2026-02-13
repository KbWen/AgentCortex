# Personal AI OS v2.6 (Flash-First)

## 🎯 專案定位

這是一套專為 **Google Antigravity / Claude** 深度定制的工業級 AI Agent 框架。v2.6 導入了 **Flash-First** 策略，確保 80% 的日常任務不由高階模型消耗，極大化節省您的 Pro 配額。

## 🚀 3 分鐘上手教學 (Quick Start)
>
> [!IMPORTANT]
> **關鍵省錢步驟**：請將您 IDE 的預設模型設為 **Gemini 1.5 Flash** (或 Anthropic Haiku)！
> 本框架採用 **Flash-First (Flash 優先)** 策略，由 Flash 處理日常事務，遇到複雜任務時 Flash 會主動要求您手動切換至 Pro。

1. **安裝**: 執行 `./deploy_brain.sh <目標專案目錄>`。
2. **初始化**: 編輯 `.agent/99_memory.md`，填入您的技術棧與 `MAX_TOKEN_FLASH`。
3. **啟動**: 將 `SYSTEM_INSTRUCTION.txt` 內容貼入 AI 平台的 System Prompt。
4. **驗證**: 呼叫「環境自檢」任務確保配置正確。

## 🏗️ 目錄結構與擴充指南

```text
.agent/
├── 00_meta_router.md       # 🧠 決策中心：Flash-First 升級邏輯
├── 99_memory.md            # 🧠 個人記憶：搭載自定義閾值與技術棧
├── rules/                  # 📜 行為規範：如 04_研究、08_安全合規
├── workflows/              # 🔄 複雜工作流：如 01_工程開發、06_摘要
├── roles/                  # 👤 思維人格：如 建築師、審查官
└── skills/                 # 🧰 專業技能：如 系統設計、代碼審查
```

## ⚖️ 模型智慧策略 (Model Strategy)

- **Flash 模式**: (預設) 處理 80% 的翻譯、測試、單檔實作任務。
- **Pro 模式**: (升級後) 處理系統設計、大規模重構與深度 Bug 調查。
- **動態升級**: 當 Flash 偵測到任務過重時，會顯示 「🛑 [Escalation]」並提示切換。

## 🛠️ 支援平台與安全建議

- **支援平台**: Google IDX, Cursor, Claude Projects, VS Code。
- **安全建議**:
  - 建議安裝 `git-secrets` 防止 Secrets 外洩。
  - 定期執行 `workflow 12` 進行配置審核。

---
詳細變更見 [CHANGELOG.md](./CHANGELOG.md)

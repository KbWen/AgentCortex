# Personal AI OS v2.5 (Industrial-Grade)

## 🎯 專案定位

這是一套專為 **Google Antigravity / Claude** 深度定制的工業級 AI Agent 框架。透過 **Workflow**、**Role**、**Rule**、**Skill** 的模組化架構，實作了「智慧模型分級策略」，旨在極大化節省高階模型配額並維持專業級輸出。

## 🚀 3 分鐘上手教學 (Quick Start)

1. **安裝**: 執行 `./deploy_brain.sh <目標專案目錄>`。
2. **初始化**: 編輯 `.agent/99_memory.md`，填入您的技術棧與 `MAX_TOKEN_FLASH`。
3. **啟動**: 將 `SYSTEM_INSTRUCTION.txt` 內容貼入 AI 平台的 System Prompt。
4. **驗證**: 呼叫「環境自檢」任務確保配置正確。

## 🏗️ 目錄結構與擴充指南

```text
.agent/
├── 00_meta_router.md       # 🧠 決策中心：支援元數據解析與動態 Token 切換
├── 99_memory.md            # 🧠 個人記憶：搭載自定義閾值與技術棧
├── rules/                  # 📜 行為規範：如 04_研究、08_安全合規、09_格式 (優先呼叫)
├── workflows/              # 🔄 複雜工作流：如 01_工程開發、06_摘要、11_數據報表
├── roles/                  # 👤 思維人格：如 建築師、審查官、研究員
└── skills/                 # 🧰 專業技能：如 10_系統設計、代碼審查、SEO、翻譯
```

### 💡 如何新增功能？ (Extension Guide)

- **規範行為？** -> 在 `rules/` 新增兩位數編號檔案。
- **新增人格？** -> 在 `roles/` 定義思維風格。
- **自動化複雜任務？** -> 在 `workflows/` 定義步驟，並於 `00_meta_router.md` 註冊。

## ⚖️ 模型智慧策略 (Model Strategy)

- **Flash 模式**: 處理輸入低於閾值的日常任務（實作、翻譯、數據剖析）。
- **Pro 模式**: 處理高複雜度推理（設計、根因調查、創意寫作）。
- **多階執行**: 先由 Flash 提取結構化結果，再由 Pro 合成高價值輸出。

## 🛠️ 支援平台

- **Google IDX / Antigravity**
- **Cursor**
- **Claude Projects**
- **VS Code**

---
詳細變更見 [CHANGELOG.md](./CHANGELOG.md)

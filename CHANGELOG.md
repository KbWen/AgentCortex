# Changelog

## [3.1.0] - 2026-02-14

### ⚖️ Agent-First Constitution (憲法級架構)

- **憲法層級**: 新增 `.agent/rules/engineering_guardrails.md`，定義 Agent 不可違背的工程準則。
- **協作介面**: 新增 `.github/ISSUE_TEMPLATE/agent_issue.md`，將任務描述結構化。
- **角色 manifest**: 新增 `docs/AGENT_PHILOSOPHY.md`，定義 AI 與人類的協作邊界。
- **腳本優化**: `deploy_brain.sh` 支援部署隱藏資料夾（.github）與文檔。

## [3.0.0] - 2026-02-14

### 🪶 Pragmatic Lean (務實精小版)

- **Radical Simplification**: 將 40+ 個檔案整理為 1 個核心 Prompt (`AGENT.md`)，系統提示開銷降低 94%。
- **Antigravity-Native**: 專位 Google Antigravity 打造，利用 IDE 自動讀取 `.agent/` 目錄的特點，減少手動配置。
- **Human-Centric Guidance**: 移除無效的自動路由，改由 `MODEL_GUIDE.md` 指引用戶手動切換模型，確保正確使用 Flash/Pro。
- **Audit Implementation**: 合併精華版 PII 掩碼、Secrets 偵測與編碼規範。

## [2.6.5] - 2026-02-13

### 🚀 Flash-First Strategy (重大策略轉變)

- **架構反轉**: 核心邏輯改為以 Flash 為主體，處理 80% 低成本任務。
- **升級請求 (Escalation)**: 當背景超出 Flash 負荷時，模型會主動停止並提示切換至 Pro，確保 100% 節省 Pro Token。
- **新版 README**: 強調操作流程的改變，降低 Token 誤用風險。

## [2.5.1] - 2026-02-13

### 🛡️ Security & Language

- **強制語言**: 全局強制使用繁體中文 (台灣) 進行對話。
- **隱私加固**: `08_compliance` 加入 PII 掩碼規則。
- **漏洞掃描**: `08_code_review` 加入 OWASP Top 10 與 Secrets 掃描指南。

## [2.5.0] - 2026-02-13

### ✨ Added

- **重大升級**: 正式進入工業級架構 (Industrial-Grade)。
- **元數據驅動**: 全檔案加入 YAML frontmatter 支援元數據解析。
- **精細化 Thresholds**: 支援各工作流自定義 Token 閾值，極大化節省成本。
- **新增 4 大工作流**: 工程開發 (`01`)、內容創作 (`10`)、數據報表 (`11`)、環境自檢 (`12`)。
- **新增 3 大規則**: 安全合規 (`08`)、格式標准 (`09`)、指令設計 (`10`)。
- **新增 3 大技能**: 質量審查、圖表建議、架構設計。

### 🚀 Optimized

- **Meta Router**: 升級動態信心調節與多階執行邏輯。
- **README**: 全面繁體中文優化，新增「擴充指南」範例。
- **Deployment**: `deploy_brain.sh` 支援更精確的模組複寫。

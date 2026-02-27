# 遷移與整合指南 (Migration & Integration Guide)

本指南說明如何將舊版 Template 升級至 vNext，以及如何在開發到一半的專案中導入此系統。

---

## 1. 專案 A：舊版升級 (Upgrade Path)

如果您已經在使用 3.0 或更舊的版本，升級到 vNext 的核心目標是：**「從流程驅動轉為狀態驅動」**。

### 步驟 1：代碼更新

1. 執行 `./deploy_brain.sh /path/to/project-a` 覆蓋新版的 `.agent/`、`AGENTS.md` 與 `README.md`。
2. **保留** `.agent/superpowers/` 目錄（目前標記為 DEPRECATED），確保舊有腳本不中斷。

### 步驟 2：初始化狀態結構

建立以下必要目錄：

- `mkdir -p docs/context/work docs/context/archive docs/specs`

### 步驟 3：狀態同步 (The "Ship" Gap)

1. 告訴 AI：*「我們剛升級到 v3.5.0，請先讀取當前專案並初始化 `docs/context/current_state.md`。」*
2. AI 會掃描現有文檔並建立 SSoT。
3. 從此階段開始，所有任務分類將改為自動化階梯式治理，並在每次 `/ship` 時自動更新 SSoT。

---

## 2. 專案 B：開發中導入 (Mid-task Integration)

要在一個已經有大量遺留資料、對話記錄且開發到一半的專案導入，重點在於 **「Catch-up (追趕狀態)」**。

### 步驟 1：環境部署

執行 `./deploy_brain.sh /path/to/project-b`。

### 步驟 2：原始素材進氣 (Raw Materials Ingestion)

利用 vNext 特有的「素材自動處理」功能。您不需要手動整理文件，直接對 AI 下令：

```text
請執行 /bootstrap。
目前的開發進度與原始討論如下，請先消化後建立系統狀態：
---
[直接貼上目前的 TODO 清單、對話記錄、專案規格書或任何雜亂的原始資料]
---
```

### 步驟 3：AI 自動重構

AI 收到素材後，會依照 vNext 邏輯自動執行：

1. **提取規格**：將雜亂素材轉化詳細規格，存入 `docs/specs/`。
2. **建立地圖**：產出第一版 `docs/context/current_state.md` 描述專案全貌。
3. **建立任務**：將「正在進行中」的事情建立為第一個 Work Log (`docs/context/work/<active-task>.md`)。

### 步驟 4：清理與對位

- 將舊有的散亂 `.md` 或 `.txt` 紀錄檔移至 `docs/context/archive/legacy/`。
- 確保所有後續開發都透過指令 (`/plan`, `/implement` 等) 進行。

---

## 💡 常見問題 (FAQ)

**Q: 舊的 `superpowers/features/` 檔案可以刪嗎？**
A: 建議在升級完畢且確認 `/bootstrap` 等新流程運作正常後再刪除。vNext 的 README 已經將所有入口導向新的 `/workflows/`，舊檔案僅作備援。

**Q: 如果我的專案很大，AI 沒辦法一次讀完所有素材怎麼辦？**
A: 建議分批給予素材。先給「核心規格」，執行 `/bootstrap` 建立 `current_state.md`；再給「具體模組細節」，執行 `/research` 更新 SSoT。

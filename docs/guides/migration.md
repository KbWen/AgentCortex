# 遷移與整合指南 (Migration & Integration Guide)

本指南說明如何將舊版 Template 升級至 vNext，以及如何在開發到一半的專案中導入此系統。

---

## 1. 專案 A：舊版升級 (Upgrade Path)

升級到 vNext 的核心目標：**「從流程驅動轉為狀態驅動」**。

### 步驟 1：備份自訂設定

> [!WARNING]
> `deploy_brain.sh` 使用 `cp` 覆蓋，**會直接蓋掉同名檔案**。

在執行部署前，先備份您在舊版中自訂過的檔案：

```bash
# 備份可能被覆蓋的自訂檔案
cp .agent/rules/engineering_guardrails.md .agent/rules/engineering_guardrails.md.bak
cp AGENTS.md AGENTS.md.bak
```

### 步驟 2：代碼更新

1. 執行 `./deploy_brain.sh /path/to/project-a` 覆蓋新版的 `.agent/` 與核心檔案。
2. **保留** `.agent/superpowers/` 目錄（已標記 DEPRECATED），確保 `validate.sh` 等工具腳本不中斷。

> [!IMPORTANT]
> 目前 `deploy_brain.sh` 仍為 v3.4.0，**不會**自動建立 vNext 新增的目錄結構（如 `docs/context/`、`.agent/workflows/`、`docs/specs/`）。請手動執行步驟 3。

### 步驟 3：初始化 vNext 目錄結構

```bash
# 建立 vNext 必要目錄
mkdir -p docs/context/work docs/context/archive docs/specs docs/adr docs/guides
# 複製 vNext 新增檔案（從 template repo）
cp <template-repo>/.agent/workflows/*.md .agent/workflows/
cp <template-repo>/docs/context/current_state.md docs/context/
cp <template-repo>/docs/guides/*.md docs/guides/
cp <template-repo>/docs/adr/*.md docs/adr/
```

### 步驟 4：合併自訂設定

將備份的 `.bak` 檔案與新版做差異比對，將您的自訂規則合併回新版：

```bash
diff .agent/rules/engineering_guardrails.md.bak .agent/rules/engineering_guardrails.md
# 將需要保留的自訂內容手動合併回新版
```

### 步驟 5：遷移舊有文件

| 舊版檔案 | 遷移目標 | 執行者 |
|---|---|---|
| 既有的 ADR | `docs/adr/` | 人工移動 |
| 散亂的任務筆記/紀錄 | `docs/context/archive/legacy/` | 人工移動 |
| 舊版自寫的 Work Log | `docs/context/work/` 或 `archive/` | 人工判斷（活躍任務留 work/，已結束移 archive/） |

### 步驟 6：狀態同步 (The "Ship" Gap)

告訴 AI：

```text
我們剛升級到 vNext v3.5.0。
請讀取當前專案結構，並初始化 docs/context/current_state.md。
```

AI 會掃描現有文檔並建立 SSoT。從此接軌自動化治理。

---

## 2. 專案 B：開發中導入 (Mid-task Integration)

重點：**「Catch-up (追趕狀態)，AI 做整理，人類不需要預處理」**。

### 步驟 1：環境部署

```bash
./deploy_brain.sh /path/to/project-b
```

### 步驟 2：初始化 vNext 目錄結構

與專案 A 步驟 3 相同。因為 `deploy_brain.sh` 目前不會建立 vNext 結構，需手動執行：

```bash
mkdir -p docs/context/work docs/context/archive docs/specs docs/adr docs/guides
# 複製 vNext 新增檔案
cp <template-repo>/.agent/workflows/*.md .agent/workflows/
cp <template-repo>/docs/context/current_state.md docs/context/
cp <template-repo>/docs/guides/*.md docs/guides/
```

### 步驟 3：原始素材進氣 (Raw Materials Ingestion)

利用 vNext 的「素材自動處理」功能。**您不需要手動整理任何檔案**，直接對 AI 下令：

```text
請執行 /bootstrap。
目前的開發進度與原始討論如下，請先消化後建立系統狀態：
---
[直接貼上目前的 TODO 清單、對話記錄、專案規格書或任何雜亂的原始資料]
---
```

### 步驟 4：AI 自動重構

AI 收到素材後，會依照 vNext 邏輯自動執行：

1. **提取規格**：將雜亂素材轉化為詳細規格，存入 `docs/specs/`。
2. **建立地圖**：產出第一版 `docs/context/current_state.md` 描述專案全貌。
3. **建立任務**：將「正在進行中」的事情建立為第一個 Work Log (`docs/context/work/<active-task>.md`)。

### 步驟 5：清理舊檔（AI 協助 + 人工確認）

> 清理由 **AI 建議**、**人工確認** 後執行。AI 不會自動刪除任何現有檔案。

- AI 會列出建議歸檔的舊有文件清單。
- 使用者確認後，將它們移至 `docs/context/archive/legacy/`。
- 確保所有後續開發都透過指令 (`/plan`, `/implement` 等) 進行。

### 關於目錄衝突

如果專案已有 `docs/` 目錄（例如 API 文件、使用手冊等），Template 的 `docs/context/` 和 `docs/specs/` 不會與它們衝突 — 它們只使用各自的子目錄。現有的 `docs/api/`、`docs/architecture/` 等結構完全不受影響。

---

## 💡 常見問題 (FAQ)

**Q: 我可以自己手動寫 `current_state.md` 嗎？**
A: 可行且推薦。如果您已經很清楚專案結構，手動寫 SSoT 是最省 Token 的方式。

**Q: 舊的 `superpowers/features/` 檔案可以刪嗎？**
A: 建議在升級完畢且確認新流程正常後再刪除。vNext 已將所有入口導向 `.agent/workflows/`。

**Q: 如果素材太多，AI 一次處理不完怎麼辦？**
A: 分批給予。先給「核心規格」執行 `/bootstrap` 建立 SSoT；再給「細節」執行 `/research` 補充。

**Q: `deploy_brain.sh` 何時升級到 vNext？**
A: 目前 `deploy_brain.sh` 仍為 v3.4.0。vNext 結構需手動初始化（見步驟 3）。未來版本將自動建立完整結構。

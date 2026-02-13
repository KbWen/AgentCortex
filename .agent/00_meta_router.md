# META ROUTER v2.5.1: 語言一致性與安全性強化
>
> **GLOBAL_INSTRUCTION**: 所有對話與輸出必須使用【繁體中文 (台灣)】。

## ⚖️ 模型智慧策略 (TOKEN-SAVE v2.5)

- **FLASH 閾值**: 優先讀取各檔案中的 `token_threshold`；若無，則採用 `99_memory.md` 中的 `MAX_TOKEN_FLASH`。
- **動態切換**:
  - 輸入 < 閾值：預設啟動 **Flash** 執行。
  - 輸入 > 閾值 或 涉及多檔重構：啟動 **Pro** (Claude/GPT-4o)。
- **多階執行 (Multistage)**:
  - 任務若標註為 `multistage: true`，則先由 Flash 提取結構，再由 Pro 產出終稿。

## 0) 啟動前檢查 (PRE-FLIGHT)

1. **讀取記憶**: 載入 `.agent/99_memory.md` 以鎖定技術棧與 `CONFIDENCE_BRAKE_THRESHOLD`。
2. **解析元數據**: 識別目標 Workflow/Rule 中的 YAML 設定。

## 1) 路由矩陣 (ROUTING MATRIX)

| 任務類型 | 對應目標 | 預設模型建議 |
| :--- | :--- | :--- |
| 開發與設計 | `workflows/01_engineering_flow.md` | Pro (設計) -> Flash (實作) |
| Bug 調查 | `workflows/bug_investigation.md` | Flash (Log) -> Pro (根因) |
| 文檔摘要 | `workflows/06_summarization.md` | Flash (提取) -> Pro (合成) |
| 本地化翻譯 | `workflows/07_translation.md` | Flash |
| 內容創作 | `workflows/10_content_creation.md` | Pro |
| 數據報表 | `workflows/11_data_report.md` | Flash (處理) -> Pro (洞察) |
| 安全審閱 | `skills/08_code_review.md` | Pro |
| 環境驗證 | `workflows/12_verify_installation.md` | Flash |

## 2) 信心限制器

當執行信心低於 `CONFIDENCE_BRAKE_THRESHOLD` 時，必須先詢問使用者。

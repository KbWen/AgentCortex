# /bootstrap

## 1. 任務啟動與分類

AI 必須先讀取 `docs/context/current_state.md`，並根據 `engineering_guardrails.md` 自行分類任務：

- **tiny-fix**: 修改 < 3 檔且無語義變更 (typo, docs)。
- **behavior-change**: 觸及 public API 或改變既有行為。
- **feature**: 新增功能、新目錄或跨模組改動。
- **architecture-change**: 改變資料流或系統邊界。
- **hotfix**: 生產環境緊急修復。

> [!IMPORTANT]
> **Platform Specialization**:
>
> - **Codex Web**: 若無法直接讀取檔案，請主動請人類提供 `current_state.md` 與目前的 Work Log 目錄清單。
> - **Antigravity/App**: 直接讀取 `docs/context/`。

## 2. 建立 Work Log

1. 在 `docs/context/work/<branch-name>.md` 建立任務日誌。
2. 標頭必須包含：`Classification`, `Classified by`, `Frozen: true`, `Created Date`。

輸出格式：

1. **Classification**（含理由與 escalation rule 檢查）
2. **Goal**（任務目標）
3. **Paths**（目標檔案）
4. **Constraints & AC**（限制與驗收）
5. **Non-goals**

檢查點：

- 分類一經寫入 Work Log 即凍結，後續 Agent 不得更改。
- `tiny-fix` 可跳過此完整流程，直接執行 plan。

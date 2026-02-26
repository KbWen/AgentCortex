# /update-docs - Documentation Sync Workflow

在開發完成或 Task 結束前執行，確保文檔與代碼一致。

## 執行步驟

1. **掃描變更**: 執行 `git diff --name-only` 識別受影響的原始碼。
2. **定位文檔**: 搜尋 `docs/` 中與變更路徑相關的 markdown 檔案。
3. **主動更新**:
    - 若功能邏輯改變，更新 `docs/specs/`。
    - 若架構變更，新建或更新 `docs/adr/`。
    - 若使用方式改變，更新 `docs/guides/` 或 `README.md`。
4. **驗收**: 確保文檔中的路徑、連結依然有效。

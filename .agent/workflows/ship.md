# /ship

## 1. 產出提交摘要

輸出格式：

- Commit message (Conventional Commits)
- 變更摘要 (條列)
- 測試結果 (Evidence)
- **文檔同步**: 執行 `/update-docs`。

## 2. 狀態更新與歸檔

1. **更新 SSoT**: 根據分類決策，更新 `docs/context/current_state.md` (僅限於 `/ship` 時執行)。
2. **歸檔 Work Log**: 將 `docs/context/work/<branch-name>.md` 移至 `docs/context/archive/<name>--<date>.md`。

> [!NOTE]
> 只有在此階段，Agent 才被授權更新全域唯讀狀態。

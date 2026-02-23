# Superpowers Workflows for Google Antigravity

## 1) 新功能探索（建議）

1. `/brainstorm`：至少提出 3 案並評估取捨。
2. `/spec`：確認 AC、Non-goals、資料契約。
3. `/plan`：列檔案、風險、回退。
4. `/implement`：按步驟實作。
5. `/review` + `/test`：確保可上線。

## 2) 小型修補（< 3 檔）

1. `/plan`：確認影響範圍與 AC。
2. `/implement`：小步提交，避免順手重構。
3. `/review`：聚焦副作用與回退。
4. `/test`：跑單檔或最小測試集合。

## 3) 中型功能（跨模組）

1. `/research`：先收斂未知項。
2. `/spec`：固定介面與邊界。
3. `/plan`：切成 Phase 1/2。
4. `/implement`：每 phase 可獨立驗收。
5. `/review` + `/test`：檢查相容性。

## 4) 緊急修復（Hotfix）

1. `/research`：界定 root cause 與 blast radius。
2. `/plan`：最小改動與回退點。
3. `/implement`：快速修補。
4. `/review`：補上替代方案取捨。
5. `/test`：重現案例 + 回歸案例。

## 5) 文件與治理更新

1. `/spec`：定義受眾與成功條件。
2. `/plan`：列出受影響文件。
3. `/implement`：同步 README / CHANGELOG / 指南。
4. `/review`：術語一致性。
5. `/retro`：沉澱可複用模板。


## 6) 跨 Agent / 人類交接

1. `/handoff`：輸出 Done / In Progress / Blockers。
2. 接手方先跑 `/bootstrap`：重建目標、限制、AC。
3. 再跑 `/plan`：確認續作範圍，避免重工。


## 7) 分支與工作目錄治理（Worktree-first）

1. 建議以獨立 branch / worktree 進行需求開發。
2. 開始前先跑 baseline tests，確認乾淨狀態。
3. 完成後再 /ship 並決定 merge / PR / 保留分支。


## 8) TDD Gate（邏輯變更必須）

1. 先寫會失敗的測試（RED）。
2. 撰寫最小實作讓測試通過（GREEN）。
3. 重構且保持測試綠燈（REFACTOR）。

# Codex 平台使用指南（Web / App）

## 適用範圍
本模板同時適用：
- Codex Web 版
- Codex App（桌面版）

## 共用建議

1. 任務開場先貼：目標、檔案、限制、驗收標準。
2. 先跑 `/bootstrap`，再跑 `/plan`。
3. 每次實作後跑 `/review` 與 `/test`。
4. 提交前跑 `./.agent/superpowers/validate.sh`。

## Web 版建議

- 對話切段：一個需求一個 thread。
- 每次輸入帶上目標檔案路徑，降低上下文漂移。
- 長任務使用 `/handoff` 保存狀態，下一輪可直接續跑。

## App 版建議

- 使用本地 repo 直接執行 `deploy_brain.sh` 與驗證腳本。
- 對大型重構可分多次 `/plan` + `/implement`，每次一個子目標。
- 每次提交前先產出 `/ship` 摘要，保持 commit 可追溯。

## 快速檢查清單

- [ ] `/bootstrap` 已完成
- [ ] `/spec` 或 `/plan` 已確認
- [ ] `/review` 已完成
- [ ] `/test` 已執行
- [ ] `validate.sh` 已通過

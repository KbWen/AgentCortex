# Antigravity Rules

## 非協商鐵律

1. 正確性優先於速度。
2. 無證據不得宣稱完成。
3. 僅修改需求範圍，避免額外重構。
4. 每次變更需可回退。

## 安全指導

- 禁止輸出 secrets（API keys、token、憑證、個資）。
- 高風險操作需先說明風險與回退方案。
- 除錯需遵循「觀察→假設→驗證→修復」。

## 命令允許 / 禁止

- 允許：唯讀檢查、格式化、測試、lint、build、最小必要檔案修改。
- 允許（需謹慎）：資料遷移、刪檔、批次改名；必須附回退策略。
- 禁止：未經需求授權的大規模重構、暴露敏感資訊、不可回退的破壞性操作。

### 具體危險命令與替代建議

- 禁止 `rm -rf <path>`（不可逆刪除）；改用 `trash <path>` 或 `mv <path> ./.backup/<timestamp>/`。
- 禁止 `git reset --hard`（可能摧毀未備份變更）；改用 `git stash push` 或 `git restore --source=<commit> <file>`。
- 禁止 `git clean -fdx`（清空未追蹤檔）；改用 `git clean -fd` 並先 `git status --short` 確認。
- 禁止 `curl ... | bash`（遠端腳本直接執行）；改用先下載再審閱：`curl -fsSL <url> -o script.sh && less script.sh && bash script.sh`。
- 禁止 `chmod -R 777`（過度放寬權限）；改用最小權限如 `chmod 755 <dir>` / `chmod 644 <file>`。

## 驗證要求

- 變更後至少執行一組相關檢查或測試。
- 記錄可重現命令與結果。
- 交付時標示已知風險與限制。

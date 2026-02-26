# Antigravity Rules

## 非協商鐵律

1. 正確性優先於速度。
2. 無證據不得宣稱完成。
3. 僅修改需求範圍，避免額外重構。
4. 每次變更需可回退。
5. **文檔優先**：在任何規劃或實作前，AI 必須主動檢索 `docs/` 與 `.agent/` 目錄，確保遵循既有規範。

## 文檔探索協議 (Document Discovery Protocol)

1. **強制掃描**：在新對話或新任務啟動時，AI 必須執行檔案列出指令（如 `ls -R docs/`）來識別可用規範。
2. **規範宣告**：在 `/plan` 指令產出時，必須明確列出參考了哪些文檔檔。
3. **衝突處理**：若專案文檔與 AI 通用知識衝突，以專案文檔為準。

## 工程憲法對齊（`.agent/rules/engineering_guardrails.md`）

- Correctness First：任何輸出需可驗證，未知行為視為不安全。
- Explicit Over Implicit：假設、限制、風險需明確寫出。
- Small & Reversible：優先小步提交，避免一次性高風險改動。
- Scope Discipline：僅解決當前 issue；延伸問題改提 follow-up。

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
- 禁止 `docker system prune -a`（可能移除執行中環境依賴與快取）；改用 `docker image prune` 或 `docker builder prune --filter until=24h`。
- 禁止 `chown -R <user>:<group> <path>`（易造成整棵目錄權限破壞）；改用 `chown <user>:<group> <path>` 或先以 `find <path> -maxdepth 2` 精準限定範圍。
- 禁止 `curl ... | bash`（遠端腳本直接執行）；改用先下載再審閱：`curl -fsSL <url> -o script.sh && less script.sh && bash script.sh`。
- 禁止 `chmod -R 777`（過度放寬權限）；改用最小權限如 `chmod 755 <dir>` / `chmod 644 <file>`。
- 禁止 `sudo` 執行不明安裝腳本；改用鎖定版本與 checksum 驗證後再安裝。
- 進行任何高風險命令前，必須先準備回退方案（備份路徑、可還原 commit、復原指令）並在執行前明確記錄。

## 驗證要求

- 變更後至少執行一組相關檢查或測試。
- 記錄可重現命令與結果。
- 交付時標示已知風險與限制。

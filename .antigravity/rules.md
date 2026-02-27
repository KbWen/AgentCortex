# Antigravity Rules

- 鐵律：正確性優先、無證據不宣稱完成、不逾越需求、小步出發且可回退。
- 文檔優先：執行任務前，必須 `ls docs/` 或檢索 `.agent/` 確保遵循專案既有規範。若有衝突以專案文檔為準。
- 對齊工程憲法（`.agent/rules/engineering_guardrails.md`）：Explicit Over Implicit, Scope Discipline。
- 安全與除錯：禁止洩漏 secrets。高風險操作需有回退方案。遵循「觀察→假設→驗證→修復」。
- 驗證：變更後必須執行相關檢查，記錄可重現的命令。交付時須標示風險。

## 命令規範

- 允許：唯讀、格式化、測試、lint、build、最小必要修改。
- 警告（需回退方案）：資料遷移、刪檔、批次改名。
- 禁止：大規模未授權重構、暴露敏感資訊、不可回退操作。
- 具體黑名單：禁止執行高破壞性系統命令（如 `rm -rf`, `git reset --hard`, `git clean -fdx`, `docker system prune -a`, `chown -R`, `chmod -R 777`, `curl | bash`, 盲目 `sudo`）。請使用可控替代方案（如 `trash`, `git stash`, `docker image prune`）並備份。

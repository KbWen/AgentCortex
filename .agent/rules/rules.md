# Agent Rules

- 鐵律：正確性優先、無證據不宣稱完成、不逾越需求、可回退。
- 文檔優先：啟動任務前讀取 `docs/context/current_state.md` 精準查閱相關文檔，禁止盲目掃描目錄樹。衝突時以專案文檔為準。
- 詳細工程規範見 `.agent/rules/engineering_guardrails.md`（按需讀取，勿每次載入）。
- 安全：禁止洩漏 secrets。高風險操作需回退方案。
- 命令黑名單：`rm -rf`, `git reset --hard`, `git clean -fdx`, `docker system prune -a`, `chown -R`, `chmod -R 777`, `curl | bash`, 盲目 `sudo`。請用可控替代方案並備份。

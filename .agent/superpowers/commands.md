# Antigravity Prompt Commands（Superpowers-style）

以下為可直接貼到對話的高訊噪比指令模板。

## /bootstrap

請先做任務啟動，不寫程式。輸出：
1) 目標
2) 目標檔案
3) 限制條件
4) 驗收標準
5) 非目標

## /brainstorm

請先進行頭腦風暴，提供至少 3 種方案並比較：
1) 優點
2) 風險
3) 實作成本
4) 建議採用方案與理由

## /research

請先做探索研究，不寫正式實作。輸出：
1) 已知事實
2) 未知風險
3) 需確認假設
4) 建議下一步

## /spec

請把需求轉成可驗收規格，輸出：
1) 目標（Goal）
2) 驗收標準（AC）
3) 非目標（Non-goals）
4) 介面/資料契約（如有）

## /plan

請先只做規劃，不寫程式。輸出：
1) 目標檔案
2) 修改步驟
3) 風險與回退策略
4) 驗收標準
5) 非目標

## /write-plan

請等同執行 `/plan`，輸出任務拆解（每個 task 2-5 分鐘）：
- 檔案路徑
- 變更內容
- 驗證方式

## /implement

依照已確認的計畫實作，限制只改列出的檔案。
完成後回報：
- 實際改動摘要
- 潛在副作用
- 建議執行的驗證命令

## /execute-plan

請等同執行 `/implement`，按計畫逐項執行並回報：
- 完成項目
- 未完成項目
- 阻塞與建議

## /review

請對本次變更做嚴格 Code Review，至少檢查：
- 邏輯正確性
- 相容性風險
- 安全性問題（Secrets / 注入 / 權限）
- 是否違反 `.agent/rules/engineering_guardrails.md`

## /test

請依 `docs/TESTING_PROTOCOL.md` 設計最小必要測試。
先列測試清單，再提供測試程式碼或測試命令。

## /retro

請針對本次任務做回顧，輸出：
- 做得好的 3 點
- 可改進的 3 點
- 下次可重用模板

## /handoff

請產出交接摘要，格式包含：
- Done
- In Progress
- Blockers
- Next
- Risks

## /ship

請產出可提交版本，格式包含：
- Commit message（Conventional Commits）
- 變更摘要（條列）
- 測試結果
- 已知限制與後續建議

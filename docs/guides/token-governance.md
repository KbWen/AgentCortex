# Token Governance Guide

## 目標

在不犧牲正確性與可追溯性的前提下，持續降低平均任務 token 成本。

## 1. 任務級 Token Budget（初版）

- `tiny-fix`：建議 1–2 回合完成。
- `behavior-change`：建議 2–4 回合完成。
- `feature` / `architecture-change`：建議 3–6 回合完成。

> 回合數是上限提醒，不是硬性失敗條件。

## 2. 必記錄指標（最小集合）

每個非 `tiny-fix` 任務建議在 work log 補充 `Token Notes`：
1. 互動回合數
2. 是否出現重複解釋（Y/N）
3. 是否命中 Fast Lane 或摘要化策略（Y/N）

## 3. 超標處置（Cost Fallback）

若小任務（docs-update / small-fix）超過預算：
1. 下一輪強制使用 `Mode: Fast Lane`。
2. 回覆格式改為固定模板（Summary + Evidence + Next），禁止冗長背景重述。
3. 僅保留必要引用與 AC 對應，不重複貼大段規範原文。

## 4. 防退化規則

- 若發現「小工作反而產生大量 token」，必須在 `/retro` 或 work log 記錄 root cause。
- 下次同類任務優先套用已驗證的短模板。

## 5. 與流程文件的關聯

- `/plan` 需包含 `Mode: Normal` 或 `Mode: Fast Lane`。
- `/handoff` 保持每區塊精簡，避免貼完整 diff。
- `/ship` 提供必要證據即可，避免重複敘述。

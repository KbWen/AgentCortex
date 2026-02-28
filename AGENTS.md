# AGENTS.md

本檔為專案層級長期指令，供所有 Agent 平台讀取。**本檔每回合自動載入，請保持精簡。**

## 核心指令

- 遵守 `.agent/rules/engineering_guardrails.md`。
- 正確性優先，禁止未驗證行為宣稱完成。
- 小步、可回退變更。禁止未授權重構。

## 狀態模型 (vNext)

- **啟動時讀取**：`docs/context/current_state.md`（SSoT）+ `docs/context/work/<branch>.md`（Work Log）。
- **禁止**：盲目掃描 `docs/` 目錄樹。依 SSoT 指引精準查閱。
- **寫入隔離**：Agent 僅寫自有 Work Log。`current_state.md` 僅在 `/ship` 時更新。
- **分類凍結**：`/bootstrap` 階段凍結，後續不得重分類。

## 交付閘門

- 非 `tiny-fix` 必須執行 `/handoff`，附帶 ≥1 doc + ≥1 code path + work log 路徑。
- 禁止無證據完成聲明。

## 參考檔案

- 工作流程：`.agent/workflows/*.md`
- 工程憲法：`.agent/rules/engineering_guardrails.md`
- 平台指南：`docs/CODEX_PLATFORM_GUIDE.md`
- 模型策略：`MODEL_GUIDE.md` (人類與 AI 能力邊界參考)

## 平台路徑

- Antigravity：`.agent/skills/` (Primary skills for Native Agent)
- Codex：`.agents/skills/` (Dedicated skills for Codex App)
- 注意：兩者獨立存在以適應不同平台配置。若需共用請手動鏡像。

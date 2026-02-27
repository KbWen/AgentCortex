# AGENTS.md

本檔為專案層級的長期指令，供 Codex 與其他 Agent 平台讀取。

## 核心憲法

- 必須遵守 `.agent/rules/engineering_guardrails.md` 的工程原則。
- 正確性優先，禁止未驗證行為直接宣稱完成。
- 優先小步且可回退的變更，避免未要求的重構。
- 每次變更需可回退。
- 優先讀取文檔：在進行規劃與實作前，優先查閱 `docs/context/current_state.md` 與任務對應的 Work Log，**禁止盲目執行目錄搜索**以節省 Token。

## 文檔探索協議 (Document Discovery Protocol)

1. **精準檢索**：AI 在啟動新任務（/bootstrap 或 /plan）時，不應掃描整棵 `docs/` 目錄樹，需依據 `current_state.md` 的指引精準查閱文檔。
2. **優先級**：專案專屬文檔 (Project-Specific Docs) 優先權高於 AI 的通用工程知識。
3. **證據引用**：若文檔中有相關規範，規劃中必須標註引用來源（例如：`Ref: docs/specs/api.md`）。

## 方法論（Superpowers）

建議流程：

1. Brainstorm / Research
2. Spec / Plan
3. Implement
4. Review / Test
5. Retro / Handoff

參考檔案：

- 指令：`.agent/superpowers/commands.md`
- 技能：`.agent/skills/<skill>/SKILL.md`
- 工作流程：`.agent/workflows/*.md`
- 平台指南：`docs/CODEX_PLATFORM_GUIDE.md`

## 安全與資料保護

- 禁止外洩 API key、token、密碼與個資。
- 若偵測敏感資訊，必須遮蔽後再輸出。
- 涉及資料操作時使用可追溯、可驗證方式。

## 狀態模型 (vNext State Model)

1. **全域唯讀狀態**：`docs/context/current_state.md` 為唯一真值來源 (SSoT)，用於讀取專案目標、憲法與系統地圖。
2. **任務隔離狀態**：每一分支/任務必須擁有獨立 Work Log：`docs/context/work/<branch-name>.md`。
3. **讀取優先級**：啟動前必須優先讀取 `current_state.md` 與對應的 Work Log，而非盲目搜索 `docs/`。

## 多 Agent 協作規則 (Multi-Agent Rules)

1. **Classification Freeze**：任務分類在 `/bootstrap` 階段凍結並寫入 Work Log 標頭，後續 Agent 不得擅自重分類。
2. **Write Isolation**：Agent 僅能寫入自有的 Work Log。僅在 `/ship` 或特定「地圖更新」任務中可更新 `current_state.md`。
3. **Continuation Protocol**：接手任務時，若 Work Log 資訊不足以重建 context，必須先補完 Work Log 才可繼續實作。

## 交付與驗證

- **Evidence Requirement**：禁止產出不可驗證的完成聲明，必須附帶證據（如測試輸出、diff 摘要）。
- **Handoff Gate**：非 `tiny-fix` 任務必須執行 `/handoff` 並存檔，確保跨回合安全。
- 回覆需包含：變更摘要、驗證命令與結果。

## 平台相容路徑 (Platform Compatible Paths)

- Antigravity：`.agent/skills`
- Codex：`.agents/skills`（本專案以符號連結對應）

## 整合來源

- `.agent/AGENT.md`
- `.agent/rules/engineering_guardrails.md`
- `.agent/rules/rules.md`

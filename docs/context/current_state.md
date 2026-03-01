# Project Current State (vNext)

- **Project Intent**: 建立可跨 Codex Web／Codex App／Google Antigravity 使用的自管理 Agent OS，降低人類流程記憶負擔並持續降低 Token 成本。
- **Core Guardrails**:
  - Correctness first：無證據不得宣稱完成。
  - Small & reversible：優先小步可回退變更，避免未授權重構。
  - Document-first：核心邏輯或架構變更須先有 Spec/ADR。
  - Handoff gate：非 `tiny-fix` 任務必須產生可追溯交接摘要。
- **System Map**:
  - 全域唯讀狀態：`docs/context/current_state.md`
  - 任務隔離狀態：`docs/context/work/<branch-name>.md`
  - 流程與政策：`.agent/workflows/*.md`、`.agent/rules/*.md`
- **ADR Index**:
  - `docs/adr/ADR-001-vnext-self-managed-architecture.md`
- **Canonical Commands**:
  - `/bootstrap`：初始化任務並凍結分類
  - `/plan`：規劃目標檔案、步驟、風險與回退
  - `/implement`：僅在 `IMPLEMENTABLE` 執行實作
  - `/review`：檢查 AC 對齊與 scope creep
  - `/test`：以 Test Skeleton 匯報測試覆蓋
  - `/handoff`：輸出可續跑狀態摘要（非 tiny-fix 必須）
  - `/ship`：彙整提交證據與更新/歸檔狀態
- **References**:
  - `AGENTS.md`
  - `.agent/rules/engineering_guardrails.md`
  - `.agent/rules/state_machine.md`
  - `docs/CODEX_PLATFORM_GUIDE.md`
  - `docs/guides/token-governance.md`

> [!NOTE]
> This file is the Single Source of Truth for global project context only.
> Do not store per-task progress here; write progress to `docs/context/work/<branch-name>.md`.

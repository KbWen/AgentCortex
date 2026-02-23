# AI Brain OS v3.3.1（Antigravity Superpowers Edition）
>
> **把 Agent 從「能用」提升到「可編排、可重複、可擴充」的 Google Antigravity 工作流模板。**

## 🎯 專案定位

此版本延續 v3.1 工程憲法，並朝 `obra/superpowers` 的核心哲學對齊：

- **Command-first**：用固定指令觸發能力，而不是每次重寫 Prompt。
- **Workflow cards**：把常見任務拆成可重複步驟。
- **Context hygiene**：預設最小上下文，降低噪音與成本。
- **Idea → Execution**：從頭腦風暴到交付採一致節奏。

> 註：目前執行環境無法直接連 GitHub（403），本版基於 superpowers 常見方法論做結構化落地。

## 🔗 參考來源

- Superpowers 專案（理念參考）：https://github.com/obra/superpowers

## 🧩 Superpowers 哲學對齊（這版新增）

本模板新增「強制流程」而非 freestyle 寫碼：

- Spec before code
- Evidence over claims
- Review as gate
- TDD gate（邏輯變更）
- 2–5 分鐘任務切分

對應檔案：
- `.agent/superpowers/policies/methodology.md`
- `.agent/superpowers/policies/state_machine.md`

## 📦 目錄總覽

- `.agent/AGENT.md`：Agent 基礎行為、語言、安全規範
- `.agent/rules/engineering_guardrails.md`：工程憲法
- `.agent/superpowers/commands.md`：可直接貼上的「指令速查」
- `.agent/superpowers/workflows.md`：場景化工作流卡片
- `.agent/superpowers/features/`：各能力模組（bootstrap / brainstorm / research / spec / implement / review / retro / handoff）
- `docs/TESTING_PROTOCOL.md`：測試標準
- `deploy_brain.sh`：一鍵部署到任意專案
- `.codex/INSTALL.md`：Codex 一句話安裝入口說明

## 🚀 原始操作流程（務必照順序）

### 1) 部署到你的專案根目錄

```bash
./deploy_brain.sh /path/to/your-project
```

若你已在目標專案根目錄：

```bash
./deploy_brain.sh .
```

### 2) 在 Antigravity 開場貼這段（建議）

### Codex 一句話入口（Web / App）

```text
Fetch and follow instructions from <your-raw-url>/.codex/INSTALL.md
```

> 若你使用本 repo 本機開發，可直接執行 `./deploy_brain.sh .`。


```text
我正在做：[需求一句話]
目標檔案：[路徑1, 路徑2]
限制條件：[例如不能改 API 回傳格式]
請先執行 /plan，不要直接寫碼
```

### 3) 用指令驅動（最常用）

1. `/brainstorm`：先發想方案、比較取捨
2. `/spec`：把需求整理成可驗收規格
3. `/plan`（或 `/write-plan`）：列檔案、步驟、風險、回退
4. `/implement`（或 `/execute-plan`）：只改已同意範圍
5. `/review`：做嚴格自審
6. `/test`：列並執行最小必要驗證
7. `/ship`：整理 commit / 變更摘要 / 測試結果

### 4) 如何呼叫每個能力檔案

你可以在對話中明確要求 Agent 參照：

- 「請依 `.agent/superpowers/features/brainstorm.md` 進行 3 案頭腦風暴」
- 「請依 `.agent/superpowers/features/spec.md` 輸出 AC 與 Non-goals」
- 「請依 `.agent/superpowers/features/review.md` 做風險分級審查」


### 5) 一鍵自我驗證（建議）

在 repo 根目錄執行：

```bash
./.agent/superpowers/validate.sh
```

這會檢查：
- 指令模板是否齊全
- 必要功能檔是否存在
- README 對應路徑是否一致

## 💬 可直接複製的提示（Prompt）

### 開場提示（Web / App 共用）

```text
請先執行 /bootstrap。
需求：[一句話]
目標檔案：[path1, path2]
限制：[不可改 API / 不可改 schema]
驗收：[列 2-3 點可驗收條件]
```

### 開發提示（規劃→實作）

```text
先 /plan，確認後再 /implement。
完成後請 /review 並給 /test 指令。
```

### 交接提示（跨回合）

```text
請輸出 /handoff，格式要包含 Done / In Progress / Blockers / Next / Risks。
```

## 🧠 Superpowers 功能對照

| 功能 | 指令 | 對應檔案 | 目的 |
| :--- | :--- | :--- | :--- |
| 任務啟動 | `/bootstrap` | `.agent/superpowers/features/bootstrap.md` | 先固定目標、限制與 AC |
| 頭腦風暴 | `/brainstorm` | `.agent/superpowers/features/brainstorm.md` | 快速發散方案並收斂 |
| 探索研究 | `/research` | `.agent/superpowers/features/research.md` | 補齊未知與限制 |
| 規格定義 | `/spec` | `.agent/superpowers/features/spec.md` | 產出可驗收規格 |
| 任務規劃 | `/plan` | `.agent/superpowers/commands.md` | 先規劃再動手 |
| 實作執行 | `/implement` | `.agent/superpowers/features/implement.md` | 安全實作、可回退 |
| 代碼審查 | `/review` | `.agent/superpowers/features/review.md` | 風險與品質檢查 |
| 回顧精進 | `/retro` | `.agent/superpowers/features/retro.md` | 形成可複用經驗 |
| 交接摘要 | `/handoff` | `.agent/superpowers/features/handoff.md` | 跨回合／跨人員無痛接手 |


## 🖥️ Codex Web / App 相容使用

本模板同時支援 Codex Web 與 Codex App。建議流程：

1. `/bootstrap`：先固定目標、限制、驗收標準。
2. `/plan`：確認改動範圍。
3. `/implement`：分段實作。
4. `/handoff`：跨回合或跨人員交接。

完整平台建議請見 `docs/CODEX_PLATFORM_GUIDE.md`。

## ✅ 專案規範符合性（目前版本）

本模板目前透過 `./.agent/superpowers/validate.sh` 檢查以下規範：

- Superpowers 必要檔案存在
- 指令章節完整（含 `/bootstrap`、`/handoff`、`/write-plan`、`/execute-plan`）
- TDD Gate（邏輯變更）
- README 與 `implement.md` 對應一致
- 平台文件 `docs/CODEX_PLATFORM_GUIDE.md` 存在
- Agent 設定已引用平台指南

## ⚙️ 建議節奏（Google Antigravity）

- 小修補：`/plan → /implement → /review → /test`
- 新功能：`/brainstorm → /spec → /plan → /implement → /review → /test`
- 緊急修復：`/research → /plan → /implement → /review → /test`

---
詳細變更請見 [CHANGELOG.md](./CHANGELOG.md)

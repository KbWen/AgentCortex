# AI Brain OS v3.5.0（vNext Architecture Edition）
>
> **從「流程驅動」進化到「自我管理」的 Agent 憲法架構。**

## 🎯 專案定位

此版本導入 vNext 自我管理架構，對齊 Google Antigravity / Codex Web / Codex App：

- **Self-Managed**：AI 自行分類任務並套用對應閘門。
- **Parallel-Safe State**：全域狀態 (`current_state.md`) 與任務狀態 (`work/`) 分離。
- **Token optimized**：針對不同風險等級自動調整治理強度。
- **Context Loss Safety**：強制執行 `/handoff` 以確保長週期任務不因上下文遺失而中斷。

---

> [!CAUTION]
> **DEPRECATION NOTICE**: `.agent/superpowers/` 目錄已正式棄用，相關邏輯已整合至 `.agent/workflows/` 與 `.agent/rules/`。

---

## 🔗 參考來源

- Superpowers 專案（理念參考）：<https://github.com/obra/superpowers>
- 專案導入範例：`docs/PROJECT_EXAMPLES.md`

## 🎯 專案定位

此版本延續 v3.1 工程憲法，並朝 `obra/superpowers` 的核心哲學對齊：

- **Command-first**：用固定指令觸發能力，而不是每次重寫 Prompt。
- **Workflow cards**：把常見任務拆成可重複步驟。
- **Context hygiene**：預設最小上下文，降低噪音與成本。
- **Idea → Execution**：從頭腦風暴到交付採一致節奏。

## 🔗 參考來源

- Superpowers 專案（理念參考）：<https://github.com/obra/superpowers>

## ✨ 新增 Superpowers 技能

本版目前提供 11 個繁體中文技能檔，對齊 [obra/superpowers](https://github.com/obra/superpowers) 的流程思維，讓 Agent 在除錯、驗證、並行協作與分支治理上更可重複執行：

- `systematic-debugging`：四階段根因分析，避免隨意修補。
- `verification-before-completion`：完成宣告前必須通過證據閘門。
- `dispatching-parallel-agents`：平行代理拆解、派工、同步、整合。
- `requesting-code-review`：提高送審品質與 reviewer 效率。
- `using-git-worktrees`：安全建立與管理 worktree。
- `finishing-a-development-branch`：分支完工後的收尾決策。

技能位置：`.agent/skills/<skill>/SKILL.md`（Codex 相容路徑：`.agents/skills`）。

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
- .agent/rules/engineering_guardrails.md：工程憲法 (含文檔優先原則)
- .agent/superpowers/commands.md：指令速查
- .agent/workflows/：單檔工作流程 (新增 /adr, /update-docs)
- docs/：文檔中心 (adr/, specs/, guides/)
- deploy_brain.sh：一鍵部署腳本
- `.codex/INSTALL.md`：Codex 一句話安裝入口說明
- `docs/PROJECT_EXAMPLES.md`：Node.js / Python 導入範例

## 🔀 Antigravity / Codex 路徑差異

- Antigravity 主要讀取：`.agent/skills`
- Codex 主要掃描：`.agents/skills`
- 本專案以符號連結讓兩者指向同一份技能來源，避免雙份維護。

完成調整後請執行：

```bash
./.agent/superpowers/validate.sh
```

可快速查看可用指令清單：

```bash
cat .agent/superpowers/commands.md
```

或在對話輸入 `/commands` 取得可用功能一覽（相容別名）。

確保技能、工作流程與 `AGENTS.md` 結構完整。

## 🗂️ 單檔工作流程（Workflow Cards）

`.agent/workflows/` 內每個 markdown 檔都可被 Antigravity 當作 workflow 卡片載入。

- `/hotfix`：載入 `.agent/workflows/hotfix.md` 的緊急修復步驟
- `/worktree-first`：載入 `.agent/workflows/worktree-first.md` 的 worktree 優先流程
- `/new-feature`：載入 `.agent/workflows/new-feature.md` 的新功能探索流程
- `/medium-feature`：載入 `.agent/workflows/medium-feature.md` 的中型功能流程
- `/small-fix`：載入 `.agent/workflows/small-fix.md` 的小型修補流程（< 3 檔）
- `/docs-update`：載入 `.agent/workflows/docs-update.md` 的文件治理流程
- `/handoff`：載入 `.agent/workflows/handoff.md` 的跨 Agent / 人類交接流程
- `/other-custom`：載入 `.agent/workflows/other-custom.md` 的其他自訂流程（治理 / TDD Gate）

若你新增流程檔（例如 `.agent/workflows/release.md`），在聊天中使用同名命令（`/release`）即可套用該流程。

### 可直接使用的流程命令

- 新功能探索：`/new-feature`
- 中型功能：`/medium-feature`
- 小型修補：`/small-fix`
- 文件更新：`/docs-update`
- 交接流程：`/handoff`
- 其他自訂：`/other-custom`
- 緊急修復：`/hotfix`
- Worktree-first：`/worktree-first`

## 🛡️ 規則檔與安全邊界

- `.antigravity/rules.md`：Antigravity 優先讀取的規則總表（工程憲法 + 安全條款 + 命令限制）。
- `.agent/rules/rules.md`：舊版相容副本，內容與 `.antigravity/rules.md` 同步。
- `codex/rules/default.rules`（同步到 `.codex/rules/default.rules`）：Codex 規則擴充入口，可用 `prefix_rule()` 加上執行前安全限制。
- `AGENTS.md`：跨平台長期指令入口，引用 `.agent/rules/engineering_guardrails.md`。

Antigravity 可直接用 `/flow-name` 呼叫 `.agent/workflows/<flow-name>.md`（例如 `/new-feature`、`/handoff`）；Codex 則會依 `AGENTS.md` 與 `.codex/rules/default.rules` 套用安全限制。

每次調整上述檔案後，請執行 `./.agent/superpowers/validate.sh` 確認路徑與內容完整。

### 高風險指令安全設定（Codex + Antigravity）

以下命令預設禁止直接執行，需先提出風險與回退方案：

- `rm -rf <path>`
- `git reset --hard`
- `git clean -fdx`
- `docker system prune -a`
- `chown -R <user>:<group> <path>`
- `curl ... | bash`
- `chmod -R 777`

建議替代：`trash <path>`、`git stash push`、`git restore --source=<commit> <file>`、`docker image prune`、限定範圍的 `chown`、先下載再審閱腳本。
並且在執行任何高風險命令前，先記錄 rollback 資訊（備份路徑、還原 commit、復原指令）。

## 🚀 原始操作流程（務必照順序）

### 1) 部署到你的專案根目錄

```bash
./deploy_brain.sh /path/to/your-project
```

若你已在目標專案根目錄：

```bash
./deploy_brain.sh .
```

### 2) 在 Codex / Antigravity 開場貼這段（建議）

### Codex 一句話入口（Web / App）

```text
Fetch and follow instructions from <your-raw-url>/.codex/INSTALL.md
```

> 若你在 Google Antigravity 使用同一套模板，也可直接貼上這段入口指令。
>
> 若你在受限網路環境遇到 `CONNECT tunnel failed, response 403`（無法抓 GitHub raw），請改用備援做法：把 `.codex/INSTALL.md` 內容完整貼進對話，並加一句「請先逐條確認再執行」。

### 2.1) 其他安裝方式（不是只有 GitHub Template）

除了「Use this template」之外，常見還有兩種：

1. **直接 clone 此 repo，再部署到你的既有專案**

```bash
git clone <this-repo-url>
cd ai-brain-template
./deploy_brain.sh /path/to/your-project
```

1. **不 clone，直接用 raw 腳本安裝**

```bash
curl -fsSL <your-raw-url>/deploy_brain.sh -o deploy_brain.sh
chmod +x deploy_brain.sh
./deploy_brain.sh /path/to/your-project
```

> 補充：若你的專案已經存在，只要執行 `./deploy_brain.sh .` 就能把 `.agent/` 與 `.codex/INSTALL.md` 佈署進去。
>
> 若你使用本 repo 本機開發，可直接執行 `./deploy_brain.sh .`。

```text
我正在做：[需求一句話]
目標檔案：[路徑1, 路徑2]
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

### 6) 專案導入範例

若你要快速導入真實專案，請直接參考：`docs/PROJECT_EXAMPLES.md`。

- Node.js API 專案範例（Express + Vitest）
- Python Backend 專案範例（FastAPI + pytest）

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
| 任務啟動 | `/bootstrap` | `.agent/workflows/bootstrap.md` | 先固定目標、限制與 AC |
| 頭腦風暴 | `/brainstorm` | `.agent/workflows/brainstorm.md` | 快速發散方案並收斂 |
| 探索研究 | `/research` | `.agent/workflows/research.md` | 補齊未知與限制 |
| 規格定義 | `/spec` | `.agent/workflows/spec.md` | 產出可驗收規格 |
| 任務規劃 | `/plan` | `.agent/workflows/plan.md` | 先規劃再動手 |
| 實作執行 | `/implement` | `.agent/workflows/implement.md` | 安全實作、可回退 |
| 代碼審查 | `/review` | `.agent/workflows/review.md` | 風險與品質檢查 |
| 回顧精進 | `/retro` | `.agent/workflows/retro.md` | 形成可複用經驗 |
| 交接摘要 | `/handoff` | `.agent/workflows/handoff.md` | **跨回合核心**：保留決策脈絡並大幅節省新對話的 Token 消耗 |

## 🖥️ Codex Web / App 相容使用

本模板同時支援 Codex Web 與 Codex App。建議流程：

1. `/bootstrap`：先固定目標、限制、驗收標準。
2. `/plan`：確認改動範圍。
3. `/implement`：分段實作。
4. `/handoff`：跨回合或跨人員交接。

> [!TIP]
> **為什麼 `/handoff` 很重要？**
>
> - **節省 Token**：避免在新對話中重新餵入長篇大論的歷史紀錄，只需提供摘要即可由新 Agent 精準接手。
> - **延續脈絡**：保留上一位 Agent 的隱性假設與未竟之志，降低重工與誤解的風險。

### Codex Web 實際操作（最短版）

1. 在 Web 開一個新 thread，先貼：

```text
Fetch and follow instructions from <your-raw-url>/.codex/INSTALL.md
```

1. 等它讀完後，再貼你的任務上下文：

```text
需求：[一句話]
目標檔案：[path1, path2]
限制：[不可改 API / 不可改 schema]
驗收：[2-3 條]
先 /bootstrap，再 /plan。
```

1. 實作時固定節奏：`/implement -> /review -> /test`。

2. 需要隔天續做時，先請它輸出 `/handoff`，下次把 handoff 貼回同 thread 或新 thread 都可。

#### Codex Web 常見錯誤（403 / 無法 fetch）

若你看到模型回覆類似「無法連到 GitHub / raw URL」，通常是執行環境封鎖外連，不是你的指令格式錯誤。可用以下備援：

1. 直接貼上 `.codex/INSTALL.md` 全文。
2. 在同一則訊息補上：

```text
以下是 INSTALL 內容，請先逐條確認你會遵循，接著再執行。
```

1. 再提供你的任務上下文（需求、目標檔案、限制、驗收）。

完整平台建議請見 `docs/CODEX_PLATFORM_GUIDE.md`。

## ✅ 專案規範符合性（目前版本）

本模板目前透過 `./.agent/superpowers/validate.sh` 檢查以下規範：

- Superpowers 必要檔案存在
- 指令章節完整（含 `/bootstrap`、`/handoff`、`/write-plan`、`/execute-plan`）
- TDD Gate（邏輯變更）
- README 與 `implement.md` 對應一致
- 平台文件 `docs/CODEX_PLATFORM_GUIDE.md` 存在
- Agent 設定已引用平台指南

## ⚙️ 建議節奏（Codex / Antigravity）

- 小修補：`/plan → /implement → /review → /test`
- 新功能：`/brainstorm → /spec → /plan → /implement → /review → /test`
- 緊急修復：`/research → /plan → /implement → /review → /test`

---
詳細變更請見 [CHANGELOG.md](./CHANGELOG.md)

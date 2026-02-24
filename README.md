# AI Brain OS v3.4.0（Antigravity Superpowers Edition）
>
> **把 Agent 從「能用」提升到「可編排、可重複、可擴充」的工作流模板。**

## 🎯 專案定位

此版本延續 v3.1 工程憲法，並朝 `obra/superpowers` 的核心哲學對齊：

- **Command-first**：用固定指令觸發能力，而不是每次重寫 Prompt。
- **Workflow cards**：把常見任務拆成可重複步驟。
- **Context hygiene**：預設最小上下文，降低噪音與成本。
- **Idea → Execution**：從頭腦風暴到交付採一致節奏。


## 🔗 參考來源

- Superpowers 專案（理念參考）：https://github.com/obra/superpowers


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
- `.agent/rules/engineering_guardrails.md`：工程憲法
- `.agent/superpowers/commands.md`：可直接貼上的「指令速查」
- `.agent/superpowers/workflows.md`：舊版工作流總表
- `.agent/workflows/`：新版單檔工作流程（new-feature / medium-feature / docs-update / hand-off / hotfix / worktree-first）
- `.agent/skills/`：新版技能目錄（每項技能使用 `SKILL.md`）
- `.agents/skills`：每個技能資料夾對應 `.agent/skills/<skill>` 的符號連結（Codex 相容）
- `.agent/skills/*/agents/openai.yaml`：Codex App UI metadata（display_name / short_description / icon_small）
- `.agent/superpowers/features/`：各能力模組（bootstrap / brainstorm / research / spec / implement / review / retro / handoff）
- `docs/TESTING_PROTOCOL.md`：測試標準
- `deploy_brain.sh`：一鍵部署到任意專案
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

確保技能、工作流程與 `AGENTS.md` 結構完整。


## 🗂️ 單檔工作流程（Workflow Cards）

`.agent/workflows/` 內每個 markdown 檔都可被 Antigravity 當作 workflow 卡片載入。

- `/hotfix`：載入 `.agent/workflows/hotfix.md` 的緊急修復步驟
- `/worktree-first`：載入 `.agent/workflows/worktree-first.md` 的 worktree 優先流程
- `/new-feature`：載入 `.agent/workflows/new-feature.md` 的新功能探索流程
- `/medium-feature`：載入 `.agent/workflows/medium-feature.md` 的中型功能流程
- `/docs-update`：載入 `.agent/workflows/docs-update.md` 的文件治理流程
- `/handoff`：載入 `.agent/workflows/handoff.md` 的跨 Agent / 人類交接流程

若你新增流程檔（例如 `.agent/workflows/release.md`），在聊天中使用同名命令（`/release`）即可套用該流程。


### 可直接使用的流程命令

- 新功能探索：`/new-feature`
- 中型功能：`/medium-feature`
- 文件更新：`/docs-update`
- 交接流程：`/handoff`
- 緊急修復：`/hotfix`
- Worktree-first：`/worktree-first`

## 🛡️ 規則檔與安全邊界

- `.antigravity/rules.md`：Antigravity 優先讀取的規則總表（工程憲法 + 安全條款 + 命令限制）。
- `.agent/rules/rules.md`：舊版相容副本，內容與 `.antigravity/rules.md` 同步。
- `.codex/rules/default.rules`：Codex 規則擴充入口，可用 `prefix_rule()` 加上執行前安全限制。
- `AGENTS.md`：跨平台長期指令入口，引用 `.agent/rules/engineering_guardrails.md`。

Antigravity 可直接用 `/flow-name` 呼叫 `.agent/workflows/<flow-name>.md`（例如 `/new-feature`、`/handoff`）；Codex 則會依 `AGENTS.md` 與 `.codex/rules/default.rules` 套用安全限制。

每次調整上述檔案後，請執行 `./.agent/superpowers/validate.sh` 確認路徑與內容完整。


### 高風險指令安全設定（Codex + Antigravity）

以下命令預設禁止直接執行，需先提出風險與回退方案：

- `rm -rf <path>`
- `git reset --hard`
- `git clean -fdx`
- `curl ... | bash`
- `chmod -R 777`

建議替代：`trash <path>`、`git stash push`、`git restore --source=<commit> <file>`、先下載再審閱腳本。

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

2. **不 clone，直接用 raw 腳本安裝**

```bash
curl -fsSL <your-raw-url>/deploy_brain.sh -o deploy_brain.sh
chmod +x deploy_brain.sh
./deploy_brain.sh /path/to/your-project
```

> 補充：若你的專案已經存在，只要執行 `./deploy_brain.sh .` 就能把 `.agent/` 與 `.codex/INSTALL.md` 佈署進去。

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

### Codex Web 實際操作（最短版）

1. 在 Web 開一個新 thread，先貼：

```text
Fetch and follow instructions from <your-raw-url>/.codex/INSTALL.md
```

2. 等它讀完後，再貼你的任務上下文：

```text
需求：[一句話]
目標檔案：[path1, path2]
限制：[不可改 API / 不可改 schema]
驗收：[2-3 條]
先 /bootstrap，再 /plan。
```

3. 實作時固定節奏：`/implement -> /review -> /test`。

4. 需要隔天續做時，先請它輸出 `/handoff`，下次把 handoff 貼回同 thread 或新 thread 都可。

#### Codex Web 常見錯誤（403 / 無法 fetch）

若你看到模型回覆類似「無法連到 GitHub / raw URL」，通常是執行環境封鎖外連，不是你的指令格式錯誤。可用以下備援：

1. 直接貼上 `.codex/INSTALL.md` 全文。
2. 在同一則訊息補上：

```text
以下是 INSTALL 內容，請先逐條確認你會遵循，接著再執行。
```

3. 再提供你的任務上下文（需求、目標檔案、限制、驗收）。

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

# AGENTS.md

本檔為專案層級的長期指令，供 Codex 與其他 Agent 平台讀取。

## 核心憲法

- 必須遵守 `.agent/rules/engineering_guardrails.md` 的工程原則。
- 正確性優先，禁止未驗證行為直接宣稱完成。
- 優先小步且可回退的變更，避免未要求的重構。

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

## 平台相容路徑

- Antigravity：`.agent/skills`
- Codex：`.agents/skills`（本專案以符號連結對應）

## 交付與驗證

- 完成前執行 `./.agent/superpowers/validate.sh`。
- 回覆需包含：變更摘要、驗證命令與結果、已知限制。


## 整合來源

- `.agent/AGENT.md`
- `.agent/rules/engineering_guardrails.md`
- `.agent/superpowers/policies/methodology.md`
- `.agent/superpowers/policies/state_machine.md`

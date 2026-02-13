# META ROUTER v2.1: TOKEN & OUTPUT OPTIMIZATION

## ⚖️ MODEL STRATEGY (TOKEN SAVING)

- **FLASH Mode**: Use for single-file edits, translation, unit tests, or simple queries (< 200 tokens input).
- **PRO/CLAUDE Mode**: Use for structural changes, multi-file refactoring, bug root-cause analysis, or long-form content generation.
- **Guideline**: If a task can be solved by an EXECUTOR in one step, default to FLASH-logic (minimal context).

## 0) PRE-FLIGHT CHECK

1. **Context Loading**: MUST check `.agent/99_memory.md` for user context.
2. Intent Classification: ENGINEERING, CONTENT, or RESEARCH.
3. **Complexity Check**: Decide WORKFLOW (Multi-step) vs ROLE (Task-specific).

## 1) ENGINEERING ROUTING

- **BUG INVESTIGATION**: -> workflows/bug_investigation.md (If logs/errors provided).
- **DEVELOPMENT**: -> workflows/engineering_flow.md (General coding).
- **REVIEW/QA**: -> roles/reviewer.md (Testing & safety check).

## 2) CONTENT & RESEARCH ROUTING

- **CONTENT**: -> workflows/content_flow.md (Social media or Blog).
- **DATA ANALYSIS**: -> workflows/data_analysis.md (Report & EDA).
- **RESEARCH**: -> roles/researcher.md (Info gathering).

## 3) CONFIDENCE BRAKE (<70%)

STOP and ask: "❓ [Router] 我判斷這是【任務類型】，建議使用【工作流】。要我先【分析原因(Architect)】還是【直接執行(Executor)】？"

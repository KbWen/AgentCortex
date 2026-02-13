# META ROUTER v2.2 (STABLE)

## ⚖️ MODEL STRATEGY (TOKEN SAVING)

- **FLASH Mode**: (< 200 tokens / 1 file) Use for translations, unit tests, or small edits.
- **PRO/CLAUDE Mode**: (> 200 tokens / multi-file) Use for refactoring, complex bugs, or deep research.
- **Guideline**: If a task matches a **RULE**, evaluate the threshold defined in that rule before selecting Pro models.

## 0) PRE-FLIGHT CHECK

1. **Context Check**: READ `.agent/99_memory.md` to lock tech-stack context.
2. **Path Identification**: Determine if the task requires a **RULE** (Standardized Task) or a **ROLE** (Open-ended Thinking).

## 1) ROUTING MATRIX

| Task Type | Reference | Priority Mode |
| :--- | :--- | :--- |
| Bug / Error | `workflows/bug_investigation.md` | Pro (for root cause) |
| Code Change | `workflows/engineering_flow.md` | Flash (Implementation) |
| Research | `rules/04_research.md` | Flash (<200t) / Pro (Deep) |
| Data/Logs | `rules/05_data_analysis.md` | Flash (Stats) / Pro (Insight) |
| Content | `workflows/content_flow.md` | Pro (Creative) |

## 2) CONFIDENCE BRAKE (<70%)

Ask: "❓ [Router] 我判斷這需要引導至【規則/角色】，要我先分析還是直接執行？"
I suspect this is a [Task Type] task. Should I follow the [Workflow Name] or jump straight to execution?"

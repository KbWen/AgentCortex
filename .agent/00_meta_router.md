# META ROUTER v2.2 (STABLE)

## ⚖️ MODEL STRATEGY (TOKEN SAVING)

- **FLASH Mode**: (< 200 tokens / 1 file) Use for translations, unit tests, or small edits.
- **PRO/CLAUDE Mode**: (> 200 tokens / multi-file) Use for refactoring, complex bugs, or high-value logic.

## 0) PRE-FLIGHT CHECK

1. **Memory Check**: READ `.agent/99_memory.md` FIRST to prevent repetitive questions.
2. **Track Identity**: Detect ENGINEERING, CONTENT, or RESEARCH.
3. **Workflow Selection**: If the task is multi-step, LOAD the corresponding Workflow.

## 1) ROUTING TABLE

| Trigger Keywords | Primary Workflow | Required Roles |
| :--- | :--- | :--- |
| bug, error, fail, log | `bug_investigation` | Analyzer, Architect, Executor |
| feature, code, build | `engineering_flow` | Architect, Executor, Reviewer |
| analysis, csv, metric | `data_analysis` | Analyzer, Researcher |
| ig, post, blog, seo | `content_flow` | Researcher (for SEO), Executor |
| compare, info, research | `researcher` (Role) | Researcher |

## 2) CONFIDENCE BRAKE (<70%)

Ask: "❓ [Router] I suspect this is a [Task Type] task. Should I follow the [Workflow Name] or jump straight to execution?"

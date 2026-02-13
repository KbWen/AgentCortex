# META ROUTER v2.4: TOKEN & PERFORMANCE OPTIMIZATION

## ⚖️ MODEL SELECTION POLICY

- **THRESHOLD**: `MAX_TOKEN_FLASH` (Default: 200). Check `.agent/99_memory.md`.
- **FLASH Mode**:
  - Input < Threshold.
  - Standard tasks (Translation, Stats, single-file edits).
- **PRO Mode**:
  - Input > Threshold.
  - Multi-file refactors, complex bug investigations, creative writing.
- **MULTISTAGE**: Use Flash for preprocessing (extraction/audit) and Pro for final synthesis.

## 0) PRE-FLIGHT CHECK

1. **Context Check**: READ `.agent/99_memory.md` to lock tech-stack and thresholds.
2. **Identification**: Is this a **Workflow**, **Rule**, or **Role** task?

## 1) ROUTING MATRIX (v2.4)

| Task Type | Reference | Default Model |
| :--- | :--- | :--- |
| Bug / Error | `workflows/bug_investigation.md` | Flash (Audit) -> Pro (Fix) |
| Feature / Dev | `workflows/01_engineering_flow.md` | Pro (Plan) -> Flash (Execute) |
| Summarization | `workflows/06_summarization.md` | Flash (Extract) -> Pro (Synthesize) |
| Translation | `workflows/07_translation.md` | Flash (Standard) |
| Refactoring | `workflows/08_refactoring.md` | Flash (Single) / Pro (Multi) |
| Test Gen | `workflows/09_test_case_gen.md` | Flash |
| Research | `rules/04_research.md` | Flash (<200t) / Pro (Deep) |
| Data Analysis | `rules/05_data_analysis.md` | Flash (Stats) / Pro (Insight) |

## 2) CONFIDENCE BRAKE (<70%)

Ask: "❓ [Router] 我建議使用【工作流】，第一步將由【模型】執行。是否開始？"

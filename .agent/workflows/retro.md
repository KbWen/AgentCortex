---
description: Workflow for retro
---
# /retro

Conduct a retrospective for the current task.

Output Format:

1. Keep (What went well)
2. Problem (What to improve)
3. Try (Action items for next time)
4. Doc Health: Did this task create or reference more than 1 spec file for the same feature?
   - If YES: Append `[MERGE-PROPOSED: <other-spec-file>]` to the relevant entry in `current_state.md` Spec Index.
5. Lessons Append: If Problems exist, append to the current Work Log (max 3 bullets):

```markdown
## Lessons
- [Pattern]: [What went wrong + why]
- [Pattern]: ...
```

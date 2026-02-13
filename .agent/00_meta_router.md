# META ROUTER v2.0 (STABLE)

## STANDARD PROTOCOL

1. **Pre-flight Check**: MUST READ `.agent/99_memory.md` for user context.
2. Identify intent: ENGINEERING or CONTENT.
3. Decide execution mode:
   - Multi-step OR unknown risk -> use WORKFLOW.
   - Single-step AND low-risk -> direct ROLE.
4. Load SKILLS only when required by workflow or role.

## ENGINEERING ROUTING

Triggers: code, bug, fix, refactor, api, test, database, auth, deploy

- If task involves planning, unknown bugs, or >1 step:
  -> workflows/engineering_flow.md
- If task is explicit and isolated:
  -> roles/executor.md
- If user asks to check or verify:
  -> roles/reviewer.md

## CONTENT ROUTING

Triggers: ig, blog, article, caption, seo, 知識方塊

- IG / short-form:
  -> workflows/content_flow.md (IG branch)
- Blog / long-form:
  -> workflows/content_flow.md (Blog branch)

## CONFIDENCE BRAKE (GLOBAL)

If confidence < 70%, STOP and ask exactly this:

"❓ 請確認：你希望我【先分析規劃】還是【直接執行】？"

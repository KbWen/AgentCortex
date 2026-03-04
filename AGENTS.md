# AGENTS.md

Global directives for all AI agents. Loaded automatically every turn.

## Chat Language Policy

- **Default Output**: Match the user's input language.
- If the user writes in English, respond in English.
- If the user writes in 繁體中文, respond in 繁體中文.

## Core Directives

- **MUST OBEY**: `.agent/rules/engineering_guardrails.md`.
- Correctness first. MUST NOT claim completion without verifiable evidence.
- Small, reversible changes. UNAUTHORIZED REFACTORING STRICTLY PROHIBITED.
- **Context Pruning**: If user interaction has exceeded 8+ turns on the same task, MUST proactively suggest: "We're at [N] turns. To save tokens, I recommend running `/handoff` and continuing in a new conversation. Proceed? (yes/no)". Do NOT wait for the user to notice. Self-initiate this suggestion.

## vNext State Model

- **Init Read**: MUST read `docs/context/current_state.md` (SSoT) + `docs/context/work/<branch>.md` (Work Log).
- **Prohibited**: Blind directory scanning (`ls -R docs/`). Read files precisely guided by SSoT.
- **SSoT Recovery Exception**: If `current_state.md` Spec Index is explicitly marked `[STALE]` or is empty AND no specs exist in the Work Log context, the AI MAY perform ONE targeted scan: `list_dir docs/specs/` ONLY. After rebuilding the index, MUST update `current_state.md` immediately and document the recovery action in the Work Log.
- **Write Isolation**: Agents ONLY write to own Work Log. `current_state.md` updated ONLY via `/ship`.
- **Classification Freeze**: Task category frozen during `/bootstrap`, MUST NOT reclassify later.

## Multi-Person Collaboration

- **One Branch = One Owner**: Never have two AI sessions writing to the same Work Log simultaneously. See `engineering_guardrails.md` §11.
- **Agent Identity**: Every session MUST write `## Session Info` (model name, timestamp, platform) to Work Log during `/bootstrap`.
- **Ship Guard**: Before `/ship`, check if `current_state.md` was modified by another session. If so, warn user before merge.

## Delivery Gates

- Non-`tiny-fix` tasks MUST execute `/handoff` with ✅ doc path + ✅ code path + work log path.
- NO EVIDENCE = NO COMPLETION.

## References

- Workflows: `.agent/workflows/*.md`
- Constitution: `.agent/rules/engineering_guardrails.md`
- Non-Linear Resilience: `docs/NONLINEAR_SCENARIOS.md` (auto-checkpoint, crash recovery, model switch handling)
- Platform Guide: `docs/CODEX_PLATFORM_GUIDE.md`

## Platform Paths

- Antigravity: `.agent/skills/`
- Codex: `.agents/skills/`
- Note: Distinct paths for platform compatibility.

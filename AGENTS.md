# AGENTS.md

Global directives for all AI agents. Loaded automatically every turn.

## Chat Language Policy

- **Default Output**: Traditional Chinese (繁體中文).
- *English Users*: To switch chat language, append "Please reply in English" to your first prompt.

## Core Directives

- **MUST OBEY**: `.agent/rules/engineering_guardrails.md`.
- Correctness first. MUST NOT claim completion without verifiable evidence.
- Small, reversible changes. UNAUTHORIZED REFACTORING STRICTLY PROHIBITED.

## vNext State Model

- **Init Read**: MUST read `docs/context/current_state.md` (SSoT) + `docs/context/work/<branch>.md` (Work Log).
- **Prohibited**: Blind directory scanning (`ls -R docs/`). Read files precisely guided by SSoT.
- **Write Isolation**: Agents ONLY write to own Work Log. `current_state.md` updated ONLY via `/ship`.
- **Classification Freeze**: Task category frozen during `/bootstrap`, MUST NOT reclassify later.

## Delivery Gates

- Non-`tiny-fix` tasks MUST execute `/handoff` with ≥1 doc path + ≥1 code path + work log path.
- NO EVIDENCE = NO COMPLETION.

## References

- Workflows: `.agent/workflows/*.md`
- Constitution: `.agent/rules/engineering_guardrails.md`
- Platform Guide: `docs/CODEX_PLATFORM_GUIDE.md`

## Platform Paths

- Antigravity: `.agent/skills/`
- Codex: `.agents/skills/`
- Note: Distinct paths for platform compatibility.

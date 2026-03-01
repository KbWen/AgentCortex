# AI Brain OS v3.5.2: High-Tier Model Review Handoff

Welcome, High-Tier Model (e.g., Claude 4.6). You are reviewing the **AI Brain Template v3.5.2**. This project is a self-managed Agent OS designed for cross-platform compatibility (Google Antigravity, Codex Web, Codex App).

## 🎯 Architecture Philosophy

- **Self-Governance**: AI classifies tasks by risk (Tiny Fix, Small/Medium/New Feature) and applies guardrails accordingly.
- **Workflow-First**: Uses standardized slash commands (`/bootstrap`, `/plan`, `/implement`) linked to specific rules.
- **Token Efficiency**: Strict English-only rules (.agent/) to minimize context bloat and maximize precision.

## 📂 Key Structural Mapping

| Component | Primary Path | Description |
| :--- | :--- | :--- |
| **Global Rules** | `AGENTS.md`, `.antigravity/rules.md` | Top-level entry points for all AI agents. |
| **Workflows** | `.agent/workflows/*.md` | Command implementation templates (vNext). |
| **Core Policies** | `.agent/rules/` | Engineering standards, state machine, methodology. |
| **Memory** | `docs/context/current_state.md` | SSoT for project status. |
| **New Tools** | `tools/validate.sh`, `tools/audit_ai_paths.sh` | Automated integrity and path verification scripts. |

## 🛠️ Refactor Summary (Cleanup v3.5.1 → v3.5.2)

1. **Removed Legacy Paths**: Deleted all files in `.agent/superpowers/`.
2. **Unified Rules**: All core policies are now centralized in `.agent/rules/`.
3. **Optimized Prompting**: Translated all AI-facing text to concise English.
4. **Improved Guardrails**: Refined `/bootstrap` and `/handoff` logic to prevent context loss.

## 🛡️ Critical Guidelines for the Reviewer

When modifying this template, ensure:

1. **Backward Compatibility**: Path aliases (e.g. `.agent/skills` and `.agents/skills`) are synchronized.
2. **Structural Integrity**: Rules MUST NOT be moved back to legacy paths.
3. **Verification**: Always run `./tools/audit_ai_paths.sh` before merging or finishing a refactor.

## 🧪 Current Verification Status

- [x] All superpower legacy files deleted.
- [x] All project-wide references updated.
- [x] deploy_brain.sh logic updated for v3.5.2.
- [x] Text encoding verified (No corrupted Chinese characters).

---
*This file is intended for high-tier architectural review. For human usage, refer to README.md.*

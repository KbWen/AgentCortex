# Personal AI OS v2.0 (Stable)

Architecture:
Router → Workflow → Role → Skill

This system is designed to work across:

- **Antigravity / Google IDX**: Paste `SYSTEM_INSTRUCTION.txt` into system prompt.
- **Cursor**: `.cursorrules` is auto-loaded.
- **Claude Projects**: Upload `.agent/` folder and paste `SYSTEM_INSTRUCTION.txt`.
- **Codex-style**: Use system prompt to point to `.agent/00_meta_router.md`.

## 🧠 Key Modules

- **Router**: `.agent/00_meta_router.md`
- **Memory**: `.agent/99_memory.md` (Edit this!)
- **Workflows**: `.agent/workflows/`
- **Roles**: `.agent/roles/`
- **Skills**: `.agent/skills/`

## 🚀 Deployment

Run `./deploy_brain.sh <target_project>` to install execution brain into any project.

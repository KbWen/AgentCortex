# Personal AI OS v2.1 (Performance Optimized)

## 🎯 Value Proposition

Modular and platform-agnostic AI agent architecture designed to reduce LLM overhead and maximize consistency.

## 🏗️ Structure

- **Router**: Intent classification & token-saving model strategy.
- **Workflows**: Multi-step process management (Dev, Bug, Analysis).
- **Roles**: Distinct task-focused personas.
- **Skills**: Atomic capability templates.

## 🚀 Setup Guide

1. **Google IDX / Antigravity**: Paste `SYSTEM_INSTRUCTION.txt` content into System Instructions.
2. **Cursor**: Automatically loaded via `.cursorrules`.
3. **Claude.ai**: Upload `.agent/` folder and paste `SYSTEM_INSTRUCTION.txt` into Project Instructions.

## ⚙️ Customization

Update `.agent/99_memory.md` with your tech stack to prevent the AI from asking repetitive questions.

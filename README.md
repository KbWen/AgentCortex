# AI Brain Template v3.5.3

> **The Professional Standard for AI-Agentic Development.**
> Build faster, scale safely, and optimize token efficiency with a battle-tested agentic architecture.

[繁體中文模式 (Traditional Chinese)](README_zh-TW.md)

---

## 🧠 What is AI Brain?

**AI Brain** is a high-performance template designed for elite developers working with agentic AI models (like Gemini Pro/Flash, Claude 3.5 Sonnet, or GPT-4o).

Unlike generic boilerplates, AI Brain provides a **structured cognitive framework** that helps AI agents understand your codebase deeply, follow engineering guardrails strictly, and execute complex tasks with minimal human intervention—all while maintaining maximum token efficiency.

## ✨ Key Features

### ⚡ Flash-First Philosophy

Optimized for high-speed, cost-effective models. The template separates "heavy" reasoning from "light" execution, making it perfect for Gemini 1.5 Flash workflows.

### 🛡️ Engineering Guardrails

Built-in safety rules preventing destructive commands (e.g., recursive deletes, hard resets) and enforcing best practices like **"No Evidence, No Completion"**.

### 🛠️ Professional Multi-Agent Skills

A library of 11+ professional agentic skills including:

- **Systematic Debugging**: 4-phase root cause analysis.
- **Test-Driven Development (TDD)**: Verified Red-Green-Refactor cycles.
- **Parallel Dispatching**: Coordinated subagent execution.

### 📉 Token Governance

Aggressive token optimization via **Context State Management**. Only the most relevant files are loaded, drastically reducing "Cold Start" costs and latency.

---

## 🏗️ Architecture Overview

The system is organized into three core layers:

1. **`.antigravity/` / `.agent/`**: The "Cortex" containing rules, logic state-machines, and agentic workflows.
2. **`codex/`**: Platform-specific adapters for Codex Web/App and Google Antigravity.
3. **`docs/context/`**: The "Memory" layer providing a Single Source of Truth (SSoT) for the project's global state.

```text
.
├── .agent/                 # Agent Intelligence (Rules & Workflows)
│   ├── rules/              # Guardrails & Methodologies
│   └── workflows/          # Slash Commands (/plan, /ship, /hotfix)
├── .agents/skills/         # Professional Skill Modules
├── .github/                # Issues & PR Templates
├── docs/                   # Multilingual Guides & Context
└── tools/                  # Validation & Audit Scripts
```

---

## 🚀 Quick Start

### 1. Installation

Clone this template into your project root:

```bash
git clone https://github.com/your-repo/ai-brain-template .
```

### 2. Synchronization

Tell your AI Agent to read the state first:
> "Read `docs/context/current_state.md` and initialize the environment."

### 3. Execution

Use the built-in slash commands to drive the AI:

- `/plan`: Create a detailed implementation plan.
- `/ship`: Verify changes and sync to mainline.
- `/hotfix`: Systematically debug and fix critical issues.

---

## 🏆 Goals of This Project

- **Scale**: Empower a single developer to manage large, complex codebases.
- **Quality**: Enforce strict engineering standards via AI automation.
- **Portability**: Maintain a consistent AI context across local IDEs and cloud-based platforms.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Built with ❤️ for the next generation of Agentic Developers.*

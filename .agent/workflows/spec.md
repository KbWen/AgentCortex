---
description: Workflow for spec
---
# /spec

Convert requirements into verifiable specs and verify consistency with existing `docs/specs/`.

Output Format:

1. Goal
2. Acceptance Criteria (AC)
3. Non-goals
4. Constraints
5. API / Data Contract (Optional)
6. State Metadata: Output YAML frontmatter with `status: draft`. Transitions to `status: frozen` when user approves.
7. File Relationship: Declare if this spec EXTENDS, REPLACES, or is INDEPENDENT from any existing `docs/specs/*.md` file.

Checkpoints:

- AC MUST be objectively verifiable.
- MUST check for conflicting legacy specs.
- Non-goals MUST prevent scope creep.
- MUST NOT modify any existing spec with `status: frozen` frontmatter (Ref: §4.1 Spec Freezing).

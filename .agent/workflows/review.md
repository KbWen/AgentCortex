# /review

Conduct strict review of current changes.

Minimum Checks:

- Logic correctness
- Compatibility risks
- Security issues (Secrets / Injections / Permissions)
- Violation of `.agent/rules/engineering_guardrails.md`

Output Format:

- Issues found (with severity)
- Fix suggestions
- Ready to commit? (Yes/No)


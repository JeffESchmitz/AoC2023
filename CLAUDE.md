# Claude Code instructions

## Git policy

- Do not commit or push unless the user explicitly requests it.
- When authorized, use the existing configured Git identity. Do not override the author or committer identity or change Git identity settings.
- Do not add AI `Co-Authored-By` trailers, generated-by signatures, or AI session links to commit messages or pull request descriptions.
- Preserve attribution to actual human contributors.
- Do not rewrite existing commit history to remove attribution unless the user explicitly requests that separately.

These instructions apply to future work. They do not change existing commit metadata.

Project attribution defaults are configured in `.claude/settings.json`.

## Puzzle-solving guidance

Default to hints and guided understanding; provide direct explanations or implementations when requested. Use one assistant unless the user requests delegation. Do not reveal unrequested puzzle solutions or future parts.

Read references selectively, not all at session startup:

- [Problem-solving framework](docs/problem-solving.md): understand a puzzle, choose a representation, compare algorithms.
- [Puzzle teacher](docs/puzzle-teacher.md): guide learning or debug reasoning.
- [Prompt examples](docs/prompts.md): reusable ways to ask for help.
- [AoCTools reference](docs/aoctools-cheatsheet.md): discover utilities; verify against the resolved dependency.
- [Daily checklist](docs/daily-checklist.md): local commands, honest test results, and day-note format.

Capture actual learning in `docs/learnings/dayNN.md` as needed. Reference material does not authorize commits, pushes, dependency changes, or extra agents; the Git policy above remains in effect.

# Agent instructions

## Everyday workflow

Work on `main` by default: solve, test the relevant day, review the diff, and make small, descriptive commits. Each day has its own source and test files, so days can be worked out of order on `main`. Committing a finished part while the next part is still in progress is fine.

Create a short-lived branch only when there is a reason:

- Unfinished or broken work that will continue on another computer.
- An experiment or alternative approach that may be discarded.
- Dependency upgrades, tooling changes, or restructuring.

Merge it soon, with or without a PR, and delete it afterward. GitHub Actions gives feedback after each push. Ordinary work doesn't need a PR or passing checks.

With more than one computer, pull before starting and push before stopping. Run `./setup` once in each clone, and download that clone's puzzle input with `./input.sh <day>`. Input never travels through Git.

## Git policy

- Do not commit or push unless the user explicitly requests it.
- Never commit or push Advent of Code puzzle input, the `.aoc-session` file, or text copied from input. Use made-up data in tests and docs. The hooks in `.githooks`, enabled by `./setup`, enforce this. Never bypass them with `--no-verify`.
- When authorized, use the existing configured Git identity. Do not override the author or committer identity or change Git identity settings.
- Do not add AI `Co-Authored-By` trailers, generated-by signatures, or AI session links to commit messages or pull request descriptions.
- Preserve attribution to actual human contributors.
- Do not rewrite existing commit history to remove attribution unless the user explicitly requests that separately.

These instructions apply to future work. They do not change existing commit metadata.

## Puzzle-solving guidance

Default to hints and guided understanding; provide direct explanations or implementations when requested. Use one assistant unless the user requests delegation. Do not reveal unrequested puzzle solutions or future parts.

Read references selectively, not all at session startup:

- [Quick start](QUICKSTART.md) and [documentation map](docs/README.md): local setup and which guide to use.
- [Problem-solving framework](docs/problem-solving.md): understand a puzzle, choose a representation, compare algorithms.
- [Puzzle teacher](docs/puzzle-teacher.md): guide learning or debug reasoning.
- [Prompt examples](docs/prompts.md): reusable ways to ask for help.
- [AoCTools reference](docs/aoctools-cheatsheet.md): discover utilities; verify against the resolved dependency.
- [Daily checklist](docs/daily-checklist.md): local commands, honest test results, and day-note format.
- [Practice sessions](docs/practice.md): toy exercises and recall on completed concepts.
- [Debugging guide](docs/debugging.md): counterexamples, state traces, and controlled performance comparisons.

Capture actual learning in `docs/learnings/dayNN.md` as needed. Reference material does not authorize commits, pushes, dependency changes, or extra agents; the Git policy above remains in effect.

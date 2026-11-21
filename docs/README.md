# Learning and coaching guide

Start with the page that matches what you need. These guides support one assistant in Codex or Claude Code; no agent stack needs installing.

| I want to… | Read | Use it for |
| --- | --- | --- |
| Get set up and run one example | [Quick start](../QUICKSTART.md) | Local commands, paths, and test behavior |
| Work through a puzzle session | [Coach mode](coach.md) | Understanding, identification, pseudocode, implementation, and reflection |
| Follow a whole puzzle session | [Daily checklist](daily-checklist.md) | Environment, checks, and recordkeeping |
| Break down an unfamiliar problem | [Problem-solving guide](problem-solving.md) | Goal, constraints, state, algorithm, invariant |
| Get hints or explain my thinking | [Puzzle teacher](puzzle-teacher.md) | Five coaching modes and a gradual hint ladder |
| Copy a useful request | [Prompt templates](prompts.md) | Discovery, review, debugging, performance, reflection |
| Practice away from a puzzle | [Practice sessions](practice.md) | Small exercises and independent recall |
| Investigate a wrong answer or slow code | [Debugging guide](debugging.md) | Small counterexamples, traces, controlled measurements |
| Discover a library helper | [AoCTools reference](aoctools-cheatsheet.md) | APIs checked against the resolved dependency |
| Track library improvements | [AoCTools changes](aoctools-changes.md) | Measured proposals and where to make them |
| Remember what I learned | [Learning log](learnings/README.md) | Actual day notes and a reusable template |
| See what came from earlier years | [Adoption notes](adoption-notes.md) | Source inventory and adaptation decisions |

## Choose the amount of help

**Learning:** You trace the example and propose a representation. The assistant asks one question at a time and offers hints as needed.

**Direct help:** Ask explicitly for an explanation, pseudocode, or implementation of the current part. The assistant should honor that request and report the checks actually run.

**Mixed:** Switch whenever useful: “Explain this step directly, then let me finish,” or “I have working code; quiz me on why it works.” There is no fixed schedule or required time per puzzle.

## A repeatable session

1. State the day, part, goal, and desired amount of help.
2. Trace a small example and explain the state before choosing an algorithm.
3. Implement the chosen approach; run the relevant tests and inspect their output.
4. Explain the invariant and the most useful failure or insight.
5. Later, retry a small variation without looking at the implementation.

The older “analyzer,” “data structure advisor,” and “edge case hunter” roles are useful review perspectives. One assistant can use them sequentially. Repository instructions in [AGENTS.md](../AGENTS.md) and [CLAUDE.md](../CLAUDE.md) govern the work, including Git policy and spoiler boundaries.

## Sources

Navigation adapted from the shared `AGENT-SYSTEM-MAP.md` and `AOC-AGENT-SYSTEM-README.md` in AoC2024 and AoC2025. See [adoption notes](adoption-notes.md) for the reviewed revisions. Historical worked solutions stay in their original repositories.

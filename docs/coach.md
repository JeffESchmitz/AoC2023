# Coach mode

Coach mode is the default for working an Advent of Code puzzle in this repository. The purpose is to understand and solve the puzzle, then retain a transferable lesson. The default is one assistant using Socratic guidance. If Jeff asks for direct implementation or says `just show me`, provide the clean solution with a short explanation instead of continuing the coaching loop.

## The working loop

1. **Understand.** Restate the goal and trace the supplied example before choosing an algorithm. Confirm the reading before proceeding.
2. **Identify.** Compare a correct brute-force approach with a more efficient fit. Explain correctness assumptions and tradeoffs before coding.
3. **Pseudocode.** Describe the state, loop, invariants, and edge cases in plain English or commented steps.
4. **Code.** Let Jeff write the implementation by default. Provide a question, small hint, stronger hint, pseudocode, or implementation at the requested help level.
5. **Reflect.** Compare actual behavior with the example and personal input. Explain the invariant, failed idea, complexity, and one transferable pattern. Record only checks that actually ran.

## The eight-step understanding pass

Use these steps once, in order, and stop at the smallest point that resolves confusion.

1. **Goal:** What exactly does the answer represent, and what type or unit does it use?
2. **Shape:** What objects, records, grid, graph, state machine, or sequence does the puzzle describe?
3. **Constraints:** Which bounds and rules limit size, values, transitions, or runtime?
4. **Input and interface:** How are records parsed? In AoC2023, what belongs in `init(input:)`, `part1()`, or `part2()`?
5. **Example trace:** Walk one supplied example and a small edge case through every intermediate state.
6. **Pattern and algorithm:** Name a candidate pattern only after the statement and constraints justify it. Compare alternatives when useful.
7. **Edge cases:** Check empty or singleton inputs, endpoints, duplicates, signs, overflow, cycles, and impossible states.
8. **Data structures:** Choose structures from the operations performed most often, and state the invariant each structure maintains.

A useful closing statement is:

> This is a [pattern] problem solved with [algorithm] using [state or data structure] in [time/space complexity].

## Hints versus promises

Before choosing an algorithm, classify each important constraint:

- A **hint** informs the affordable approach or target complexity. It is not a guard unless the puzzle promise makes it load-bearing.
- A **promise** is load-bearing. The solution's correctness depends on it, such as sorted order, uniqueness, acyclic transitions, or guaranteed reachability.

When a constraint is a promise, record it briefly beside the implementation or test. Do not quietly forget it after mentioning it. Do not turn every hint into defensive code.

## Help modes

- **Discovery:** Ask for the state or condition the next step depends on.
- **Exploration:** Compare representations or explain why one algorithm fits and another does not.
- **Validation:** Ask Jeff to trace a boundary or explain the invariant before code proceeds.
- **Debugging:** Locate the first divergent state. Ask for expected behavior, actual behavior, and the smallest counterexample.
- **Synthesis:** Connect the solution to a completed problem or pattern, while explaining what differs here.

One focused question at a time is enough. Hints may progress from a question to a clue, pseudocode, and direct implementation. If Jeff changes the requested help level, follow the new level instead of continuing a quiz.

## Before implementation

State whether the session is learning, direct, or mixed. Add the public example and published answer to `Tests/DayNNTests.swift` before relying on it. List a few edge cases and the state invariant.

Do not expose personal puzzle input or the `.aoc-session` file in code, tests, prompts, or learning notes. Do not reveal unrequested future parts or other people's solutions.

## After implementation

Run the narrowest useful sample test before broad validation. Report passes, skips, and failures honestly. A skipped test is not puzzle verification. Before claiming a personal-input result, independently confirm the answer and the command that produced it.

Use [the daily checklist](daily-checklist.md) for commands and [the debugging guide](debugging.md) for small counterexamples and fair measurements. Use [the learning template](learnings/TEMPLATE.md) only when a lesson is worth preserving.

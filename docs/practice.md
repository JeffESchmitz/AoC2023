# Practice sessions

Practice one skill at a time using a toy problem or an already completed puzzle. The aim is to explain and reuse an idea independently. These exercises are optional and do not mark an AoC day complete.

## A short practice loop

1. Choose one exercise and write down what you expect before running code.
2. Trace a tiny case by hand. State what each variable represents.
3. Write pseudocode or a small implementation without opening the old solution.
4. Check it against the trace and a boundary case. Explain the invariant aloud.
5. Record what needed a hint. Retry a variation in a later session.

Stop when you can explain the idea; a timer can help keep the session small, but speed is not the assessment.

## Exercises

### 1. Translate words into state

Use a ring of 12 positions, numbered 0–11, starting at position 3. Moves can be positive or negative, including moves longer than a full turn. First describe the final position; then describe how you would count visits to position 0 during a move.

- What changes between those two questions?
- Trace a zero-length move, an exact full turn, a negative move, and multiple full turns.
- Explain which information can be discarded after each move and why.

Ask for one hint if stuck; do not look up a complete ring simulation first.

### 2. Distinguish unique items from total items

Process `red, blue, red, green, blue, red`. Build one representation for the distinct labels and another for the number of occurrences of each label.

- Which operation does each representation make easy?
- What information disappears when you deduplicate?
- Now merge two batches. Explain whether each question needs a union or addition of counts.

Connect this to a completed day only after explaining the toy case.

### 3. Trace a small graph

Use the undirected edges `A-B`, `A-C`, `B-D`, `C-D`, and `D-E`. Starting at A, record the queue, newly discovered nodes, and distances after each step of an equal-cost shortest-path search.

- Decide when a node becomes visited and explain why.
- Check what happens if you add a cycle or an isolated node F.
- Change one edge to cost 10. Which correctness argument now needs revisiting?

If you implement a queue using an array, use a read index rather than repeatedly removing its first element. Additional packages are not required for this exercise.

### 4. Turn enumeration into counting

Use the directed edges `A-B`, `A-C`, `B-D`, and `C-D`. List all paths from A to D, then work out how to count them without storing every path.

- Explain the base case at the destination and at a dead end.
- Which subproblem repeats if you extend the graph?
- What must a cache key contain? What changes if the graph gains a cycle?

Treat acyclicity as an assumption to establish, not a conclusion from arrows on a drawing.

### 5. Debug a boundary mistake

Choose a loop from a completed day that accesses an element and the next element, or counts an inclusive range. Explain its legal indices before running it.

- Try the smallest valid input and the smallest input with no pair.
- Trace the last iteration and identify every index it accesses.
- Change one boundary in a scratch copy, predict the failure, and find a tiny example that exposes it.

Keep scratch work separate from the working solver. Use the [debugging guide](debugging.md) to locate the first divergence.

### 6. Measure a refactoring fairly

Choose a completed solver with a measurable cost. Compare a loop with a collection pipeline, or repeated calculation with precomputation.

- Check identical answers first, then change one thing at a time.
- Use the same input and build configuration, with several runs of each version.
- Include parsing and initialization when they move work across a timing boundary.
- Report time and memory tradeoffs; accept a result of “no useful improvement.”

Historical claims that functional, imperative, or lazy code is always faster are hypotheses to test on this implementation.

## Check whether the learning transferred

| Stage | Evidence |
| --- | --- |
| Recognize | Identify relevant constraints without naming an algorithm from a keyword alone |
| Explain | Trace the example and justify the representation and invariant |
| Apply | Implement a small variation with limited hints |
| Transfer | Explain what changes when a key assumption changes |

Record the stage you demonstrated and the help you used. Avoid marking a topic “mastered” just because a familiar example passed. Keep short notes using the [learning template](learnings/TEMPLATE.md); day-specific notes belong in the [learning log](learnings/README.md).

## Copy-paste coaching prompt

> Use docs/practice.md. Give me one small exercise on [skill] using a toy example or a puzzle I've already completed. Ask me to predict and explain before coding. Offer one hint at a time, wait for my answer, and don't reveal a future AoC solution. At the end, suggest a small variation for later recall.

## Sources

Exercises are new toy variations adapted from the practice, reflection, and teaching ideas in both years' learning trackers and `AOC-PUZZLE-TEACHER.md`. See [adoption notes](adoption-notes.md). Historical answers and worked puzzle solutions are not copied into these exercises.

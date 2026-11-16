# Problem-solving guide

Start with understanding; use an algorithm only after its assumptions fit the puzzle. This guide transfers lessons from 2025 without revealing solutions for specific 2023 days.

## Before coding: eight questions

1. **Goal:** What exactly must the answer represent? What are its units?
2. **World:** What objects, positions, connections, or states exist?
3. **Constraints:** Which transitions are legal? What are the input sizes and numeric limits?
4. **Input:** How are records separated? Do order, duplicates, signs, and blank lines matter?
5. **Trace:** Work through the supplied example by hand. Identify each intermediate state.
6. **Algorithm:** Which approaches fit the constraints? Explain why each would be correct and affordable.
7. **Edge cases:** Check boundaries, empty/singleton cases where permitted, repeated values, ties, cycles, and unreachable states.
8. **Representation:** Choose structures for the operations performed most often. State the invariant they maintain.

Write a short explanation or pseudocode before implementing. A clear brute-force solution on tiny inputs is useful as a correctness oracle even when it will not scale.

## Patterns to recognize, not force

| Structure of the problem | Candidate approach | Check first |
| --- | --- | --- |
| Fewest equal-cost steps | BFS | State includes everything affecting future moves |
| Minimum nonnegative weighted cost | Dijkstra; possibly A* | Correct edge costs and, for A*, a suitable heuristic |
| First threshold where a property changes | Binary search | The predicate is monotone |
| Many repeated subproblems | Memoization or dynamic programming | Cache key includes all relevant state; cycles have a defined treatment |
| Independent groups joined over time | Union-find | Connectivity, rather than actual paths, is the required result |
| Repeated simulation | Cycle detection | Repeated full state implies identical future behavior |
| Large ranges of equivalent values | Interval processing | Inclusive/exclusive boundaries and overlap cases |
| A greedy choice seems sufficient | Greedy algorithm | An exchange argument or other proof, not just a passing example |

Do not infer a technique from a single word such as “minimum.” Explain why the graph, recurrence, or ordering actually models the puzzle.

## Representation and scaling

- Use sets for membership and dictionaries for keyed state/counts; expected constant-time lookup does not mean worst-case constant time.
- For BFS, avoid repeated `Array.removeFirst()`. An array plus a read index can suffice; use a deque only when its package product is explicitly available to the target.
- Keep parsing, reusable precomputation, and answer calculation separate where that helps clarity. Do not manufacture three phases for a tiny problem.
- Before Part 2, restate the changed constraints. Preserve a correct Part 1 approach as a reference; measure before optimizing.
- Compare an optimized implementation with the small oracle on representative tiny cases. Watch for work repeated inside nested loops.

## Decide what a state means

Before choosing a collection, state whether the answer concerns existence, unique items, total occurrences, paths, or a minimum cost. A set merges equal items; a dictionary of counts preserves their multiplicity. Neither is interchangeable merely because both support fast lookup.

Two states may share a cache entry only when they have the same future behavior for the result being computed. Include remaining resources, direction, depth, or other relevant parameters when the rules depend on them. Establish termination or handle cycles explicitly.

Keep original parsed data available when both parts need a fresh simulation. Decide from the rules whether a round reads one snapshot and applies changes together, or whether each change immediately affects the next operation.

## Reuse a model without forcing the next part

When the requested Part 2 is available, separate what stayed the same from what changed: input interpretation, transition rules, accounting, constraints, or output. A helper with meaningful parameters may serve both parts, but some changes require a different algorithm. Do not predict an unseen part's solution.

Precompute a reusable fact when its repeated cost justifies storage. Measure setup as well as the parts when assessing total runtime. See [debugging and performance](debugging.md) for a fair comparison.

## Swift checks

Integer division truncates toward zero: `-3 / 2 == -1`. It is not floor division. Check overflow before multiplying large counts. `split` omits empty subsequences by default. String integer indexing is not generally constant time; use an appropriate representation when repeatedly scanning. Preserve significant blank lines during parsing.

## Finish by explaining

Can you explain why it works, its time/space costs, the failure that taught you most, and the signal that would help you recognize the pattern again? Capture those in a short day note using the [daily checklist](daily-checklist.md).

For guided help see [puzzle teacher](puzzle-teacher.md); for reusable requests see [prompts](prompts.md). Retry a toy variation using [practice sessions](practice.md) to check whether the idea transferred.

## Provenance

Adapted from [TwelveDaysOfCode-2025-Learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/TwelveDaysOfCode-2025-Learnings.md), [AOC-AGENT-QUICK-START.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-QUICK-START.md) at AoC2025 commit `e277e770319fcdd342f178e44cc37f06ae644c58`. These are curated 2023 adaptations, not synchronized copies. The original documents retain the longer worked examples and historical context.

Expanded with representation, counting, and reuse lessons from both years' day notes; see [adoption notes](adoption-notes.md).

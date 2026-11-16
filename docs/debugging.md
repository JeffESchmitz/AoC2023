# Debugging and performance practice

Start with a specific mismatch: input, expected result, actual result, and the command that produced it. A historical note saying “all tests pass” is not evidence about the current checkout.

## Find the first wrong state

1. **Check the test data.** Compare the public example, parameters, and expected result with the requested part. A transcription error can look like an algorithm bug; [Day 4](learnings/day04.md) records a real example.
2. **Shrink the case.** Remove records or simplify values while preserving the failure. Distinguish valid edge cases from malformed input the puzzle never permits.
3. **Predict a trace.** Write expected intermediate states before adding logging or using a debugger.
4. **Compare the trace with execution.** Find the first divergence rather than guessing from the final answer.
5. **Test one explanation.** Make the smallest correction supported by that evidence and rerun the focused check.
6. **Keep the regression case** when it exposes meaningful behavior the existing tests miss.

For coaching, ask for a question or hint at each step. For a direct fix, explicitly ask the assistant to implement it.

## Questions that expose common mistakes

| Area | Ask |
| --- | --- |
| Parsing | Did splitting omit a meaningful empty section? Did trimming destroy alignment? Are coordinates x/y or row/column? |
| Boundaries | Are both endpoints included? Is this value an index, count, or coordinate? Can every `i + 1` access succeed? |
| Counting | Are duplicates meant to merge, accumulate, or count only once per group? |
| State | Does the state remember everything that affects the next move? Is the cache scoped to the right input and parameters? |
| Simulation | Are updates simultaneous or sequential? Does Part 2 start from the original state? |
| Search | Is the predicate actually monotone? Are endpoints checked? Does the claimed shortest-path algorithm match the costs? |
| Numbers | Could addition or multiplication overflow? Does negative integer division or remainder behave as intended? |

A simple solver on tiny inputs can serve as an oracle for an optimized version. A disagreement deserves investigation even if the personal-input answer was accepted. Random checks supplement explicit boundary cases and correctness reasoning; they do not prove full coverage.

## Check performance without moving the goalposts

Only optimize when input sizes or measured runtime justify the extra complexity.

1. Establish correct answers and a baseline with the current input.
2. State what you are measuring: parsing, initialization, one part, or the whole run.
3. Keep the machine, input, and debug/release configuration comparable. Use several runs to see variation.
4. Change one thing, recheck answers, then measure the same scope again.
5. Explain whether the gain came from less work, a different data structure, fewer allocations, or moving work outside the timer.

Precomputing in `init` can eliminate repeated work across parts, but it still costs time and memory. A faster `part1()` timer alone does not establish an equivalent improvement in total runtime. Functional pipelines, explicit loops, and `.lazy` each need measurement in context.

For this repository, `./run 4` uses release mode while `swift run AdventOfCode 4` defaults to debug. Do not report their difference as the effect of a source change. The [daily checklist](daily-checklist.md) explains focused test commands and skipped tests.

## Keep a useful failure note

Record: the mistaken assumption, the smallest counterexample, the first wrong state, the correction, and the command/result that verified it. Separate observations from explanations still being tested. Use the [learning template](learnings/TEMPLATE.md) when there is a lesson worth keeping.

## Sources

Adapted from debugging sections in both years' learning trackers and day notes, especially AoC2024's state/indexing notes and AoC2025's measured-refactoring notes. See [adoption notes](adoption-notes.md). Historical timings are not benchmarks for AoC2023.

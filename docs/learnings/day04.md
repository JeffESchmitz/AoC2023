# Day 4 · Scratchcards

- **Parse once for both parts.** Split each card at `:` and `|`, then split each number list on spaces and convert with `Int($0)`. Keeping the label separate prevents the card ID from being counted as a winning number. The winning numbers go into a `Set`, and counting your numbers that it contains gives the match count, which both parts reuse.
- **Track counts when copies behave identically.** Start with one copy of every card. Process cards in order and add the current card’s copy count to each card it wins. Every card only awards later cards, so its count is final by the time you process it. AoCTools’ `sum()` gives the final total.
- **Check the example against the puzzle before changing the solver.** The copied sample had `60` in Card 2’s winning numbers where the official sample has `61`. Correcting that restored the expected **13** points and **30** cards. Both sample tests and both personal-input tests passed, and SwiftLint reported zero violations in the two Day 4 Swift files.

## Measure before blaming the algorithm

The algorithm was already linear, but parsing took about 90% of the runtime. The pinned AoCTools `integers()` (0.1.11) builds a Swift `Regex` on every call and only accepts a `String`, so each number list also needed a `String(...)` copy. Day 4 calls it twice per card.

- **Evidence:** a scratch benchmark outside the repo, built with `swiftc -O`. It times only per-card match counting on the 201-card personal input, takes the best of 20 runs, and excludes file loading. All three versions found the same 872 total matches.

  | Parsing approach | Time |
  | --- | --- |
  | `integers()` regex + two `Set`s, intersected | 9.6 ms |
  | `split(separator: " ").compactMap { Int($0) }` + one `Set` | 0.9 ms |
  | Byte-level parse into a 128-bit bitset | 0.05 ms |

- **Change made:** we switched to the second row. With `./test 4` (release mode), each personal-input test dropped from about 0.012 s to 0.001 s, all four Day 4 tests passed, and SwiftLint reported 0 violations in `Sources/Day04.swift`.
- **Trade-off kept in mind:** counting your numbers against one `Set` would count a duplicate twice, while the intersection counted it once. AoC inputs have no duplicates. The bitset version is fastest but harder to read, so it stays a practice exercise.
- **Signal to recognize:** a regex-based helper called once per line in a loop. Simple, whitespace-separated numbers don’t need a regex. Ideas for fixing this in the library are in [AoCTools changes](../aoctools-changes.md).

## Comparing Day 4 solutions

We implemented and tested our solver before reviewing Gereon Steffens’s Day 4 solution. Our solver uses his AoCTools library for summation, and originally used it for integer parsing as well. The comparison below came afterward. [Gereon Steffens’s Day 4 source on Codeberg](https://codeberg.org/gereon/AoC2023/src/branch/main/Sources/Day04.swift)

- **Put a rule on the type it belongs to.** Gereon’s private `Card` holds the ID and match count. Its computed `points` property gives the scoring rule a clear home, so Part 1 can read as summing each card’s points. Our match counts are enough here. Reach for a small type when an item has several fields or rules.
- **Use IDs as indices when the input guarantees the numbering.** Leaving `copies[0]` unused lets Gereon use `copies[card.id]` directly. This works when IDs start at 1, are consecutive, and arrive in order, and when every awarded card exists. Our version uses input position and caps the award range at the end of the array.
- **Make edge cases visible.** Swift interprets `1 << -1` as a right shift, so Gereon’s scoring expression returns zero for zero matches. Our explicit check states that rule directly. We also keep the newline split that drops empty lines. The pinned AoCTools `lines` helper preserves a trailing empty line, which would reach the card parser.

[Puzzle](https://adventofcode.com/2023/day/4) · [Solver](../../Sources/Day04.swift) · [Tests](../../Tests/Day04Tests.swift) · [Learning log](README.md)

# Day 4 · Scratchcards

- **Parse once for both parts.** Split each card at `:` and `|`, then use AoCTools’ `integers()` on each number list. Keeping the label separate prevents the card ID from being counted as a winning number. A set intersection gives the match count, which both parts reuse.
- **Track counts when copies behave identically.** Start with one copy of every card. Process cards in order and add the current card’s copy count to each card it wins. Every card only awards later cards, so its count is final by the time you process it. AoCTools’ `sum()` gives the final total.
- **Check the example against the puzzle before changing the solver.** The copied sample had `60` in Card 2’s winning numbers where the official sample has `61`. Correcting that restored the expected **13** points and **30** cards. Both sample tests and both personal-input tests passed, and SwiftLint reported zero violations in the two Day 4 Swift files.

## Lessons from Gereon Steffens

- **Put a rule on the type it belongs to.** Gereon’s private `Card` holds the ID and match count. Its computed `points` property gives the scoring rule a clear home, so Part 1 can read as summing each card’s points. Our match counts are enough here. Reach for a small type when an item has several fields or rules.
- **Use IDs as indices when the input guarantees the numbering.** Leaving `copies[0]` unused lets Gereon use `copies[card.id]` directly. This works when IDs start at 1, are consecutive, and arrive in order, and when every awarded card exists. Our version uses input position and caps the award range at the end of the array.
- **Make edge cases visible.** Swift interprets `1 << -1` as a right shift, so Gereon’s scoring expression returns zero for zero matches. Our explicit check states that rule directly. We also keep the newline split that drops empty lines. The pinned AoCTools `lines` helper preserves a trailing empty line, which would reach the card parser.

[Puzzle](https://adventofcode.com/2023/day/4) · [Solver](../../Sources/Day04.swift) · [Tests](../../Tests/Day04Tests.swift) · [Learning log](README.md)

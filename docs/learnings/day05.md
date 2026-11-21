# Day 5 · If You Give A Seed A Fertilizer

## Context and status

- **Part:** Part 1.
- **Status:** Implemented and public-example verified. Personal-input confirmation and Part 2 are not complete.
- **Help used:** Detailed coaching, guided example tracing, direct implementation, and refactoring for clarity.

## What made the problem clearer

The answer is the lowest location produced after passing each starting seed through the category maps in order. Each map row reads as:

```text
destination start | source start | length
```

The source interval is half-open:

```swift
sourceStart..<(sourceStart + length)
```

For a matching value, the calculation has three steps:

1. Confirm that the value belongs to the source interval.
2. Calculate its offset from the source start.
3. Add the same offset to the destination start.

For example, `68 64 13` contains light value `74` in `64..<77`. Its offset is `74 - 64 == 10`, so its destination is `68 + 10 == 78`.

The implementation models the input at three levels:

- `SeedPipeline` owns the seeds and ordered category steps.
- `CategoryStep` selects one matching instruction or preserves the value when none match.
- `IntervalInstruction` stores a destination start and a Swift `Range<Int>`, then preserves the source offset in the destination interval.

The invariant is: after every category step, the current value represents the same seed at the next category.

For `S` seeds and `R` total map rows, the worst-case Part 1 time is `O(S × R)`. The parsed seed and interval data takes `O(S + R)` space, with an additional `O(S)` temporary array of final locations.

## The mistake and the refactor

The confusing mistake was reading the first column as the range to test. In `45 77 23`:

- `77` is the source start.
- `23` is the length.
- `45` is the destination start.

The source values are `77..<100`; light value `74` cannot match that row. Using Swift’s half-open range removed the separate `length - 1` calculation and made the boundary easier to see.

Giving each parsing level its own initializer also improved the shape of the code. `Day05.init` now passes `input.lines` into `SeedPipeline`, while `CategoryStep` and `IntervalInstruction` parse their own sections and rows.

AoCTools provides the needed helpers:

- `lines` preserves the blank lines that separate sections.
- `grouped` splits at those blank lines.
- `integers()` extracts numbers from the seed and instruction lines.

`Algorithms` is not imported because Part 1 does not need one of its helpers, and the root target does not directly declare that transitive dependency.

## Evidence

```text
swift test --filter 'AoCTests.Day05Tests/testDay05_part1()' --skip '_solution'
```

Result: one public-example test passed and produced `35`.

```text
swift test --filter 'AoCTests.Day05Tests/testDay05_mappingSteps()'
```

Result: one focused matching and identity test passed.

```text
./lint
```

Result: zero violations in 27 Swift files.

The personal-input expected answer remains unset, so no personal Part 1 confirmation is claimed. Part 2 is not implemented.

## Next time

- Recognize range-translation rows by the explicit order: destination start, source start, length.
- Match only against the source interval.
- Preserve an offset, rather than trying to reinterpret the length as a distance to add or subtract.
- Prefer a native half-open `Range<Int>` for inclusive-start, exclusive-end membership.
- Move parsing into the type that owns the corresponding level of input.

[Puzzle](https://adventofcode.com/2023/day/5) · [Solver](../../Sources/Day05.swift) · [Tests](../../Tests/Day05Tests.swift) · [Learning log](README.md)

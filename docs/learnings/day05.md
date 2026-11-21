# Day 5 · If You Give A Seed A Fertilizer

## Context and status

- **Parts:** Part 1 and Part 2.
- **Status:** Both parts are implemented and verified against the public examples and personal input. Advent of Code accepted both answers and awarded two stars.
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

## Part 2: transform intervals, not every seed

Part 2 changes the seed numbers into `(start, length)` pairs. The public pair `79 14` becomes `79..<93`, and `55 13` becomes `55..<68`.

Expanding those ranges into individual seeds would repeat work for every value. Instead, `CategoryStep` carries each half-open interval through a map:

1. Sort the map instructions by source start.
2. Keep cursor-tracked portions that do not match any instruction unchanged.
3. Split each matching overlap into its own interval.
4. Shift the matched interval to its destination while preserving its length.
5. Repeat for the next category step.

The invariant is: the output intervals cover exactly the same set of mapped values represented by the input intervals, with no values omitted or duplicated by a split.

The regression that caught a design mistake was a Part 1 input containing only one seed. Seed-pair parsing initially happened during `SeedPipeline.init`, so that valid Part 1 input crashed because it had an odd number of seeds. Pair interpretation now happens only when Part 2 is called.

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
swift test --filter 'AoCTests.Day05Tests/testDay05_part2()' --skip '_solution'
```

Result: one public Part 2 test passed and produced `46`.

The mapping-step test also checks a range split where the source maps only parts of an interval and leaves the gaps unchanged.

```text
swift test --filter 'AoCTests.Day05Tests/testDay05_part1_solution()'
```

Result: one personal-input test passed after the independently confirmed expected answer was added.

```text
swift test --filter 'AoCTests.Day05Tests/testDay05_part2_solution()'
```

Result: one personal-input Part 2 test passed after Advent of Code confirmed the candidate.

```text
./lint
```

Result: zero violations in 27 Swift files.

Advent of Code accepted both independently confirmed personal answers. The day is complete at 2 stars.

## Next time

- Recognize range-translation rows by the explicit order: destination start, source start, length.
- Match only against the source interval.
- Preserve an offset, rather than trying to reinterpret the length as a distance to add or subtract.
- Prefer a native half-open `Range<Int>` for inclusive-start, exclusive-end membership.
- Move parsing into the type that owns the corresponding level of input.
- When ranges are the input and output, transform and split interval pieces instead of enumerating every value.
- Keep part-specific input interpretation lazy enough that Part 2 assumptions do not break a valid Part 1 call.

[Puzzle](https://adventofcode.com/2023/day/5) · [Solver](../../Sources/Day05.swift) · [Tests](../../Tests/Day05Tests.swift) · [Learning log](README.md)

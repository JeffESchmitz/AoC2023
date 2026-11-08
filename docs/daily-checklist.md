# AoC2023 daily checklist

Use this from the repository root. Pick the day you want; completing earlier days is not required.

## Once per environment

- [ ] Check `swift --version` and the selected Xcode/macOS SDK. The root package requires macOS 26; the inspected AoCTools 0.1.11 dependency requires Swift 6.4. Confirm the actual resolved manifest rather than copying the 2025 toolchain pin.
- [ ] Run `swift build`; check SwiftLint availability with `./lint`. See the root [setup instructions](../README.md#-setup).
- [ ] Keep `.aoc-session` and `Sources/Inputs/*Input.swift` private. Do not paste the cookie or full personal input into documentation.

## Before implementing a part

- [ ] Choose day and part; say whether you want hints or direct implementation.
- [ ] Use the [eight questions](problem-solving.md) to establish the goal, representation, constraints, and example trace.
- [ ] Populate the relevant example in `Tests/DayNNTests.swift` and replace that example test's `nil` with the published expected result. Do not change assertions merely to match buggy output.
- [ ] List a few small boundary/adversarial cases and a correctness invariant.

## Implement and check

- [ ] Work in `Sources/DayNN.swift`; retain the existing `AdventOfCode` / `AoCTests` package conventions.
- [ ] Run sample tests for the selected day, for example `swift test --filter AoCTests.Day05Tests --skip '_solution'` for Day 5. Inspect which tests ran and which were skipped; there is no fixed 23-test total in 2023.
- [ ] When ready for personal data, use `./input.sh 5` (substitute the day). This downloader is fixed to 2023 and writes `Sources/Inputs/Day05+Input.swift`; it has no AOC_YEAR override.
- [ ] Use `./run 5` for that day's results. Record solution expectations only after independently confirming the answer; `./test 5` then runs that day's sample and solution tests in release mode.
- [ ] Understand the template: empty sample/personal input skips the corresponding tests; nonempty input with a `nil` expected answer fails and reports the computed value. Skips are not successful puzzle verification.
- [ ] Run `./lint`; measure performance only when the constraints or observed runtime justify it. Do not run all days' unfinished solutions as a validation shortcut.

## Reflect and review

- [ ] Create `docs/learnings/dayNN.md` when there is something to record. No empty day placeholders are required.
- [ ] Record: **part/status**, **problem cues**, **representation/invariant**, **approach and complexity**, **failed idea or bug**, **checks actually run**, and **what to recognize next time**. Keep private inputs out. Distinguish verified completion from a hypothesis.
- [ ] Update README progress only for confirmed completion. Review the diff for unrelated changes or private data.
- [ ] Commit/push only when explicitly requested, following [AGENTS.md](../AGENTS.md).

## Provenance

Adapted from [CHECKLIST.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/CHECKLIST.md), [AOC-AGENT-QUICK-START.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-QUICK-START.md) at AoC2025 commit `e277e770319fcdd342f178e44cc37f06ae644c58`. These are curated 2023 adaptations, not synchronized copies. The original documents retain the longer worked examples and historical context.

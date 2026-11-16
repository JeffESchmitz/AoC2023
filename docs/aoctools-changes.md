# AoCTools changes

Changes we would like in [AoCTools](https://codeberg.org/gereon/AoCTools), with the evidence for each one. This page is a record of advice only. Nothing here has been applied to AoCTools or to this repository’s dependency.

Checked against AoCTools **0.1.11**, the pinned version and the newest tag, and against `main` at `1e7804d` (2026-10-23).

## 1. Faster `integers()`

**Status:** proposed and measured; not submitted upstream.

### Problem

`String.integers()` builds a RegexBuilder `Regex` (an optional `-` followed by digits) on every call, then runs `matches(of:)`. It is defined only on `String`, so callers holding a `Substring` must copy it first with `String(...)`. The current `main` branch has the same code.

### Evidence

This was a scratch benchmark outside the repository, built with `swiftc -O -swift-version 6`. It extracts every integer from each line of the 201-line Day 4 personal input, takes the best of 20 runs, and excludes file loading. All three versions produced the same checksum (376 258).

| Implementation | Time |
| --- | --- |
| Current: regex built per call, `String` copy | 8.9 ms |
| Same regex built once and reused, `String` copy | 8.4 ms |
| UTF-8 byte scanner on `StringProtocol`, no copy | 0.08 ms |

**Lesson:** caching the regex barely helps. Most of the cost is in the regex matching itself, so the fix is to stop using a regex for this.

### Proposed code

About 25 lines replace the regex version in `Sources/String.swift`. Moving the method to `StringProtocol` keeps every existing `"...".integers()` call compiling, because `String` conforms to `StringProtocol`, and lets `Substring` call it directly.

```swift
extension StringProtocol {
    /// Extracts signed integers. A `-` directly before a digit is a sign.
    public func integers() -> [Int] {
        var result: [Int] = []
        var value = 0
        var negative = false
        var inNumber = false
        var pendingMinus = false

        for byte in utf8 {
            if byte >= UInt8(ascii: "0") && byte <= UInt8(ascii: "9") {
                if !inNumber {
                    inNumber = true
                    negative = pendingMinus
                    value = 0
                }
                value = value * 10 + Int(byte - UInt8(ascii: "0"))
                pendingMinus = false
            } else {
                if inNumber {
                    result.append(negative ? -value : value)
                    inNumber = false
                }
                pendingMinus = byte == UInt8(ascii: "-")
            }
        }
        if inNumber {
            result.append(negative ? -value : value)
        }
        return result
    }
}
```

### Behavior parity

The code above, copied out of this page into a scratch program, matched the current regex output on all three upstream `testIntegers` cases in `Tests/StringTests.swift` and on these inputs:

- `"1-2"` → `[1, -2]`
- `"a-5"` → `[-5]`
- `"--3"` → `[-3]`
- `"x 12 -7 - 8"` → `[12, -7, 8]`
- `""` and `"-"` → `[]`
- A Day 4 card line

It also compiled and ran when called on a `Substring`. An upstream PR should add these cases to `testIntegers`.

Two known differences need to be decided or documented:

- **Overflow:** for a digit run too large for `Int`, the current regex backtracks and splits it into smaller numbers: `"99999999999999999999 4"` gives `[999999999999999999, 99, 4]`. The scanner as written above would trap. Our local `fastIntegers()` skips the oversized run instead, using `multipliedReportingOverflow` and `addingReportingOverflow`, and accumulates toward the sign so `Int.min` still parses. An upstream PR should propose skipping and point out the current splitting behavior.
- **Non-ASCII digits:** the regex’s `.digit` matches Unicode digits such as `٣`, but the scanner only reads ASCII `0`–`9`. AoC input is ASCII, so this should not matter in practice, but the doc comment should say so.

**Estimated size:** about 25 lines of source and 8–10 lines of tests. No API is added or removed.

## 2. Candidate: a non-empty lines helper

**Status:** idea only; not measured.

`lines` deliberately preserves empty lines, including a trailing one, and upstream tests assert this. Several days need the opposite: `split(whereSeparator: \.isNewline)`. A separate helper, for example `nonEmptyLines` returning `[Substring]`, would make that choice explicit without changing `lines`. Raise it only if it keeps coming up.

## Where the changes could live

Work through these in order. Stop at the first option that is enough.

1. **Local extension in this repository.** ✅ Done: `fastIntegers()` in [`Sources/StringProtocol+FastIntegers.swift`](../Sources/StringProtocol+FastIntegers.swift), with tests in [`Tests/FastIntegersTests.swift`](../Tests/FastIntegersTests.swift) that check it against `integers()`. We avoided the name `integers()` because `String` calls would resolve to the AoCTools version and `Substring` calls to ours, which is confusing. No dependency change was needed. Day 4 doesn’t use it; it still uses plain `split` + `Int`. Use `fastIntegers()` on later days that mix numbers with other text.
2. **Offer it upstream.** AoCTools is MIT-licensed, and this change is a backward-compatible performance fix with parity tests. That is the easiest kind of change to accept. Open a Codeberg issue first with the benchmark table and the parity cases, and ask whether Gereon wants a PR. He may prefer a different trade-off, such as keeping the regex for readability.

   > **To do, step 2 (paused 2026-11-16).** Next session:
   > - Draft the Codeberg issue text: the problem, the benchmark table, the parity cases, and the overflow-splitting quirk.
   > - Decide whether to offer `fastIntegers()`’s overflow handling or the shorter version above.
   > - Run the scanner against AoCTools’ own `swift test` in a scratch clone, not in this repository.
   > - Ask before posting anything to Codeberg. Posting is public.
3. **Fork, if upstream declines and more than one repository needs it.** Fork on Codeberg, keep `upstream` as a remote, and periodically rebase your few commits onto new tags. Point `Package.swift` at the fork, for example `.package(url: "<your fork>", branch: "fast-integers")` or your own tag. For quick local trials, `swift package edit AoCTools --path ../AoCTools` overrides the dependency without changing `Package.swift`.
4. **Your own package, only if you end up maintaining many changes.** A separately named library means owning everything it contains, including grids, A*, and points, and losing upstream fixes unless you port them. Use a different module name so it can sit next to AoCTools if needed. MIT requires keeping Gereon’s copyright and license notice on any copied code.

Per [CLAUDE.md](../CLAUDE.md), changing the dependency (options 3 and 4) is a dependency change. Do it on a branch, and only when you have explicitly asked for it.

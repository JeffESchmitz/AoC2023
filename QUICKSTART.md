# AoC2023 quick start

Work from the repository root. Use this page to get started; the [daily checklist](docs/daily-checklist.md) covers a complete session.

## Check the environment

```sh
cd AoC2023
swift --version
swiftly run swift --version
xcode-select -p
```

The root package declares Swift tools 6.2 and macOS 26. AoCTools 0.1.11 requires Swift 6.4. With Swift 6.2 or 6.3, SwiftPM resolves 0.1.10 instead, which has the same source code. See [setup](README.md#-setup) and the [dependency reference](docs/aoctools-cheatsheet.md#version-and-dependency-boundary). Another year's toolchain pin or package lockfile is not a setup step here.

The project-local `.swift-version` contains `xcode`, so Swiftly and VS Code's Swiftly tasks use the toolchain selected by `xcode-select`. On this machine that is Swift 6.4.2. This selector follows the selected Xcode rather than pinning an exact release. If resolution reports Swift 6.3.3, check `swiftly run swift --version` from this directory and reload VS Code after selecting the correct toolchain. It does not require changing Swiftly's global default.

## Turn on the input guard (once per clone)

```sh
./setup
```

This turns on the git hooks that block any commit or push containing puzzle input or `.aoc-session`. Git never enables hooks from a clone automatically, so run it again on every new machine or clone. See [the hooks README](.githooks/README.md).

## If Codeberg is blocked on your network

`Package.swift` fetches AoCTools from [Codeberg](https://codeberg.org/gereon/AoCTools). On a machine that can reach GitHub but not Codeberg, keep `Package.swift` as it is and point SwiftPM at your own GitHub copy instead:

1. Mirror the Codeberg repository to your GitHub account, ideally private. Name the copy **`AoCTools`**: SwiftPM takes the package's identity from the mirror URL, and any other name breaks the build with "product 'AoCTools' … not found".
2. On the blocked machine, add a global SwiftPM mirror in `~/.swiftpm/configuration/mirrors.json`. It applies to every package on that machine:

   ```json
   {
     "object" : [
       {
         "mirror" : "https://github.com/<you>/AoCTools.git",
         "original" : "https://codeberg.org/gereon/AoCTools"
       }
     ],
     "version" : 1
   }
   ```

3. Run `swift package resolve` and check that it fetches from your GitHub copy.

`swift package config set-mirror` only writes a mirror for the current clone. For a private copy, Git needs GitHub credentials (`gh auth setup-git`), and Xcode needs the account under Settings → Accounts.

## Try one completed example

Day 4 has populated public examples:

```sh
swift test --filter AoCTests.Day04Tests --skip '_solution'
```

This selects the Day 4 sample tests without requiring personal input. Check the output for failures and skips. This guide does not promise a fixed total for the whole repository.

## Start your chosen day

Use Day 5 below as a placeholder for whichever day you choose:

```sh
swift build
swift test --filter AoCTests.Day05Tests --skip '_solution'
```

Edit `Sources/Day05.swift` and `Tests/Day05Tests.swift`. The day files and runner registrations already exist; there is no generator to run. Add the puzzle's public example and its published expected answer to the relevant test before relying on it. Empty input skips a test; a `nil` expected answer with nonempty input fails and reports the computed answer.

When ready to check personal input:

```sh
./input.sh 5
./run 5
./test 5
./lint
```

The downloader needs your private session cookie in `.aoc-session`, always downloads **2023**, and writes `Sources/Inputs/Day05+Input.swift`. Keep both files private. `./run` and `./test` use release builds; the direct `swift test` command above uses the default debug configuration. Compare timings only under matching conditions.

Pass a day explicitly: outside December the runner defaults to all days, which includes unfinished puzzles. `./test` without a day also includes unfinished tests. If using Xcode, open the package with `xed .` and set the executable's day argument explicitly.

## Start a coaching session

> I'm working on AoC 2023 Day [N], Part [P]. Use docs/coach.md and docs/puzzle-teacher.md. This is a [learning/direct/mixed] session. Here is my interpretation and what I've tried: [details]. Start with one question or a small hint. Don't reveal later parts unless I ask.

Use [Coach mode](docs/coach.md) for the working loop, [prompts](docs/prompts.md) for a reusable request, [practice](docs/practice.md) for a short exercise, and the [documentation map](docs/README.md) to find the right reference. Record a useful discovery in the [learning log](docs/learnings/README.md).

## Sources

Adapted from AoC2025's [QUICKSTART.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/QUICKSTART.md) and [CHECKLIST.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/CHECKLIST.md). Commands and paths were checked against this repository. See the [adoption notes](docs/adoption-notes.md) for the complete review.

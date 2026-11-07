# Advent Of Code 2023

My [AoC 2023](https://adventofcode.com/2023) Solutions in Swift

This repo was generated from gereon's [AoCTemplate](https://codeberg.org/gereon/AoCTemplate), with minor modifications to fit my working style.

### Overview

All code for all days is compiled into a single macOS commandline binary, which can be run either from within Xcode or from Terminal.

Each day usually has 3 associated source files:

* `DayX.swift` for the solution code
* `DayX+Input.swift` for the puzzle input. This file is created by running the `input.sh` script (see below) but is not included in this repo for [legal reasons](https://www.reddit.com/r/adventofcode/wiki/faqs/copyright/inputs).
* `DayXTests.swift` for the test suite, if the puzzle has test cases

`AoC.swift` has the `main()` function which runs one (or all) of the puzzles, then prints the solution(s) and the elapsed time.

The code relies on the [AoCTools](https://codeberg.org/gereon/AoCTools) package, a collection of utility functions for things frequently used in AoC, such as 2D and 3D points, [hexagonal grids](https://www.redblobgames.com/grids/hexagons/), an [A\* pathfinder](https://en.wikipedia.org/wiki/A*_search_algorithm) and more.

### Xcode

Open the project via the `Package.swift` file (`xed .` from Terminal in the project directory). `Cmd-R` will either run the puzzle for the current calendar day during December, or for all days in other months. To override this, change `defaultDay` in `AoC.swift`.

`Cmd-U` runs the test suite for all 25 days. Run individual tests by clicking on them in the Test Inspector (`Cmd-6`)

### Commandline

From the commandline, use `swift run` or `swift run -c release`. 

To run the puzzle for a specific day without changing `AoC.swift`, use `swift run AdventOfCode X` to run day `X`. `X` can be a number from 1 to 25 or `all`.

To run tests, use `swift test` for all tests, or e.g. `swift test --filter AoCTests.Day02Tests` to run the tests for day 2.

### Linting

This project doesn't run SwiftLint as part of its own build. Use `./lint` to check the sources against `.swiftlint.yml`, or `./lint --fix` to autocorrect. On macOS, install SwiftLint with `brew install swiftlint`.

On macOS, SwiftLint needs Xcode selected as the developer directory, not just the Command Line Tools: `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer` (adjust the path to your Xcode). The AoCTools dependency runs SwiftLint on its own sources during `swift build`, so the build needs this too.

A GitHub Action (`.github/workflows/lint.yml`) runs `swiftlint lint` on pushes to `main` and on pull requests, and shows violations as annotations.

### Puzzle Inputs

Use the included `input.sh` script to download your puzzle input. To be able to run this script, [grab the session cookie](https://www.reddit.com/r/adventofcode/comments/a2vonl/how_to_download_inputs_with_a_script/) from [adventofcode.com](https://adventofcode.com) and create a `.aoc-session` file with the contents. Use `input.sh X` to download day X's input. During December, `input.sh` with no argument downloads the current day's input. If the download fails (the puzzle isn't unlocked yet, or the session cookie has expired), the script reports the error and leaves any existing input file untouched.

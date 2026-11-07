//
// Advent of Code 2023 Day 2 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 2` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 2 Tests")
struct Day02Tests {
    @Test("Day 2 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay02_part1() async {
        let day = Day02(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 2 Part 1 Solution", .enabled(if: !Day02.input.isEmpty, "no puzzle input yet"))
    func testDay02_part1_solution() async {
        let day = Day02(input: Day02.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 2 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay02_part2() async {
        let day = Day02(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 2 Part 2 Solution", .enabled(if: !Day02.input.isEmpty, "no puzzle input yet"))
    func testDay02_part2_solution() async {
        let day = Day02(input: Day02.input)
        await expectAnswer(day.part2(), nil)
    }
}

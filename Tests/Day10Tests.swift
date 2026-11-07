//
// Advent of Code 2023 Day 10 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 10` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 10 Tests")
struct Day10Tests {
    @Test("Day 10 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay10_part1() async {
        let day = Day10(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 10 Part 1 Solution", .enabled(if: !Day10.input.isEmpty, "no puzzle input yet"))
    func testDay10_part1_solution() async {
        let day = Day10(input: Day10.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 10 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay10_part2() async {
        let day = Day10(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 10 Part 2 Solution", .enabled(if: !Day10.input.isEmpty, "no puzzle input yet"))
    func testDay10_part2_solution() async {
        let day = Day10(input: Day10.input)
        await expectAnswer(day.part2(), nil)
    }
}

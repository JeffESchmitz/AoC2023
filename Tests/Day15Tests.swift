//
// Advent of Code 2023 Day 15 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 15` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 15 Tests")
struct Day15Tests {
    @Test("Day 15 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay15_part1() async {
        let day = Day15(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 15 Part 1 Solution", .enabled(if: !Day15.input.isEmpty, "no puzzle input yet"))
    func testDay15_part1_solution() async {
        let day = Day15(input: Day15.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 15 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay15_part2() async {
        let day = Day15(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 15 Part 2 Solution", .enabled(if: !Day15.input.isEmpty, "no puzzle input yet"))
    func testDay15_part2_solution() async {
        let day = Day15(input: Day15.input)
        await expectAnswer(day.part2(), nil)
    }
}

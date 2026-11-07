//
// Advent of Code 2023 Day 20 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 20` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 20 Tests")
struct Day20Tests {
    @Test("Day 20 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay20_part1() async {
        let day = Day20(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 20 Part 1 Solution", .enabled(if: !Day20.input.isEmpty, "no puzzle input yet"))
    func testDay20_part1_solution() async {
        let day = Day20(input: Day20.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 20 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay20_part2() async {
        let day = Day20(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 20 Part 2 Solution", .enabled(if: !Day20.input.isEmpty, "no puzzle input yet"))
    func testDay20_part2_solution() async {
        let day = Day20(input: Day20.input)
        await expectAnswer(day.part2(), nil)
    }
}

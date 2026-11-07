//
// Advent of Code 2023 Day 22 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 22` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 22 Tests")
struct Day22Tests {
    @Test("Day 22 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay22_part1() async {
        let day = Day22(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 22 Part 1 Solution", .enabled(if: !Day22.input.isEmpty, "no puzzle input yet"))
    func testDay22_part1_solution() async {
        let day = Day22(input: Day22.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 22 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay22_part2() async {
        let day = Day22(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 22 Part 2 Solution", .enabled(if: !Day22.input.isEmpty, "no puzzle input yet"))
    func testDay22_part2_solution() async {
        let day = Day22(input: Day22.input)
        await expectAnswer(day.part2(), nil)
    }
}

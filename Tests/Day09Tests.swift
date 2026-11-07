//
// Advent of Code 2023 Day 9 Tests
//

import Testing
@testable import AdventOfCode

// Paste the example input from the puzzle description here.
fileprivate let testInput = """
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 9` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 9 Tests")
struct Day09Tests {
    @Test("Day 9 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay09_part1() async {
        let day = Day09(input: testInput)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 9 Part 1 Solution", .enabled(if: !Day09.input.isEmpty, "no puzzle input yet"))
    func testDay09_part1_solution() async {
        let day = Day09(input: Day09.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 9 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay09_part2() async {
        let day = Day09(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 9 Part 2 Solution", .enabled(if: !Day09.input.isEmpty, "no puzzle input yet"))
    func testDay09_part2_solution() async {
        let day = Day09(input: Day09.input)
        await expectAnswer(day.part2(), nil)
    }
}

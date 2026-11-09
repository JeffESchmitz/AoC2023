//
// Advent of Code 2023 Day 4 Tests
//

import Testing
@testable import AdventOfCode

private let testInput = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""

// Personal-input tests run when the local input is available.
@Suite("Day 4 Tests")
struct Day04Tests {
    @Test("Day 4 Part 1", .tags(.testInput))
    func testDay04_part1() async {
        let day = Day04(input: testInput)
        #expect(await day.part1() == 13)
    }

    @Test("Day 4 Part 1 Solution", .enabled(if: !Day04.input.isEmpty, "no puzzle input yet"))
    func testDay04_part1_solution() async {
        let day = Day04(input: Day04.input)
        #expect(await day.part1() == 21_485)
    }

    @Test("Day 4 Part 2", .tags(.testInput))
    func testDay04_part2() async {
        let day = Day04(input: testInput)
        #expect(await day.part2() == 30)
    }

    @Test("Day 4 Part 2 Solution", .enabled(if: !Day04.input.isEmpty, "no puzzle input yet"))
    func testDay04_part2_solution() async {
        let day = Day04(input: Day04.input)
        #expect(await day.part2() == 11_024_379)
    }
}

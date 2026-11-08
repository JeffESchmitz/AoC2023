//
// Advent of Code 2023 Day 3 Tests
//

import Testing
@testable import AdventOfCode

// Personal-input checks remain skipped until input is available.
@Suite("Day 3 Tests")
struct Day03Tests {
    @Test("Day 3 examples")
    func testDay03_examples() async {
        let input = """
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
        """
        let day = Day03(input: input)
        #expect(await day.part1() == 4361)
        #expect(await day.part2() == 467835)
    }

    @Test("Day 3 gear adjacency and boundaries")
    func testDay03_gears() async {
        #expect(await Day03(input: "12*3").part2() == 36)
        #expect(await Day03(input: "1*1").part2() == 1)
        #expect(await Day03(input: "1.2\n.*.\n.3.").part2() == 0)
        #expect(await Day03(input: "12\n.*").part1() == 12)
        #expect(await Day03(input: "12\n.*").part2() == 0)
    }

    @Test("Day 3 Part 1 Solution", .enabled(if: !Day03.input.isEmpty, "no puzzle input yet"))
    func testDay03_part1_solution() async {
        let day = Day03(input: Day03.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 3 Part 2 Solution", .enabled(if: !Day03.input.isEmpty, "no puzzle input yet"))
    func testDay03_part2_solution() async {
        let day = Day03(input: Day03.input)
        await expectAnswer(day.part2(), nil)
    }
}

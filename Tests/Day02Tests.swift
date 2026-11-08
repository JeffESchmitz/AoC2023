//
// Advent of Code 2023 Day 2 Tests
//

import Testing
@testable import AdventOfCode

// Personal-input checks remain skipped until input is available.
@Suite("Day 2 Tests")
struct Day02Tests {
    @Test("Day 2 examples")
    func testDay02_examples() async {
        let input = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """
        let day = Day02(input: input)
        #expect(await day.part1() == 8)
        #expect(await day.part2() == 2286)
    }

    @Test("Day 2 limits and missing colors")
    func testDay02_limits() async {
        let day = Day02(input: "Game 7: 12 red, 13 green, 14 blue\nGame 8: 13 red\nGame 9: 1 red")
        #expect(await day.part1() == 16)
        #expect(await day.part2() == 2184)
    }

    @Test("Day 2 Part 1 Solution", .enabled(if: !Day02.input.isEmpty, "no puzzle input yet"))
    func testDay02_part1_solution() async {
        let day = Day02(input: Day02.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 2 Part 2 Solution", .enabled(if: !Day02.input.isEmpty, "no puzzle input yet"))
    func testDay02_part2_solution() async {
        let day = Day02(input: Day02.input)
        await expectAnswer(day.part2(), nil)
    }
}

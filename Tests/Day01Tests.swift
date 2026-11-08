//
// Advent of Code 2023 Day 1 Tests
//

import Testing
@testable import AdventOfCode

// Personal-input checks remain skipped until input is available.
@Suite("Day 1 Tests")
struct Day01Tests {
    @Test("Day 1 Part 1 examples")
    func testDay01_part1() async {
        let input = "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet"
        #expect(await Day01(input: input).part1() == 142)
    }

    @Test("Day 1 Part 2 examples and overlapping words")
    func testDay01_part2() async {
        let input = "two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen"
        #expect(await Day01(input: input).part2() == 281)
        #expect(await Day01(input: "twone\noneight\nsevenine").part2() == 21 + 18 + 79)
    }

    @Test("Day 1 Part 1 Solution", .enabled(if: !Day01.input.isEmpty, "no puzzle input yet"))
    func testDay01_part1_solution() async {
        let day = Day01(input: Day01.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 1 Part 2 Solution", .enabled(if: !Day01.input.isEmpty, "no puzzle input yet"))
    func testDay01_part2_solution() async {
        let day = Day01(input: Day01.input)
        await expectAnswer(day.part2(), nil)
    }
}

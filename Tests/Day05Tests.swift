//
// Advent of Code 2023 Day 5 Tests
//

import Testing
@testable import AdventOfCode

fileprivate let testInput = """
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
"""

// The example tests are skipped until `testInput` is filled in, and the solution
// tests until `./input.sh 5` has downloaded the puzzle input.
// Replace each `nil` with the expected answer. Until then the test fails and
// reports the answer your code computed.
@Suite("Day 5 Tests")
struct Day05Tests {
    @Test("Day 5 Part 1", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay05_part1() async {
        let day = Day05(input: testInput)
        await expectAnswer(day.part1(), 35)
    }

    @Test("Day 5 mapping steps")
    func testDay05_mappingSteps() async {
        let matchingInput = """
        seeds: 74

        light-to-temperature map:
        68 64 13
        """
        #expect(await Day05(input: matchingInput).part1() == 78)

        let identityInput = """
        seeds: 74

        light-to-temperature map:
        45 77 23
        81 45 19
        """
        #expect(await Day05(input: identityInput).part1() == 74)
    }

    @Test("Day 5 Part 1 Solution", .enabled(if: !Day05.input.isEmpty, "no puzzle input yet"))
    func testDay05_part1_solution() async {
        let day = Day05(input: Day05.input)
        await expectAnswer(day.part1(), nil)
    }

    @Test("Day 5 Part 2", .tags(.testInput), .enabled(if: !testInput.isEmpty, "no example input yet"))
    func testDay05_part2() async {
        let day = Day05(input: testInput)
        await expectAnswer(day.part2(), nil)
    }

    @Test("Day 5 Part 2 Solution", .enabled(if: !Day05.input.isEmpty, "no puzzle input yet"))
    func testDay05_part2_solution() async {
        let day = Day05(input: Day05.input)
        await expectAnswer(day.part2(), nil)
    }
}

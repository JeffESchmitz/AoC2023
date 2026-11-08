// Advent of Code 2023 Day 3: Gear Ratios
// https://adventofcode.com/2023/day/3

import AoCTools

final class Day03: AdventOfCodeDay {
    let title = "Gear Ratios"
    private struct Position: Hashable {
        let row: Int
        let column: Int
    }
    private struct Number {
        let value: Int
        let adjacentToSymbol: Bool
        let gears: Set<Position>
    }
    private let numbers: [Number]

    init(input: String) {
        let grid = input.split(whereSeparator: \.isNewline).map(Array.init)
        var found: [Number] = []
        for row in grid.indices {
            var column = 0
            while column < grid[row].count {
                guard grid[row][column].wholeNumberValue != nil else {
                    column += 1
                    continue
                }
                let start = column
                var value = 0
                while column < grid[row].count, let digit = grid[row][column].wholeNumberValue {
                    value = value * 10 + digit
                    column += 1
                }
                var adjacent = false
                var gears: Set<Position> = []
                for neighborRow in max(0, row - 1)...min(grid.count - 1, row + 1) {
                    for neighborColumn in max(0, start - 1)...column {
                        guard grid[neighborRow].indices.contains(neighborColumn) else { continue }
                        let cell = grid[neighborRow][neighborColumn]
                        if !cell.isNumber && cell != "." { adjacent = true }
                        if cell == "*" { gears.insert(Position(row: neighborRow, column: neighborColumn)) }
                    }
                }
                found.append(Number(value: value, adjacentToSymbol: adjacent, gears: gears))
            }
        }
        numbers = found
    }

    func part1() async -> Int {
        numbers.filter(\.adjacentToSymbol).reduce(0) { $0 + $1.value }
    }

    func part2() async -> Int {
        var adjacentNumbers: [Position: [Int]] = [:]
        for number in numbers {
            for gear in number.gears { adjacentNumbers[gear, default: []].append(number.value) }
        }
        return adjacentNumbers.values.reduce(0) { total, values in
            total + (values.count == 2 ? values[0] * values[1] : 0)
        }
    }
}

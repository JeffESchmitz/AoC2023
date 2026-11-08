// Advent of Code 2023 Day 1: Trebuchet?!
// https://adventofcode.com/2023/day/1

import AoCTools

final class Day01: AdventOfCodeDay {
    let title = "Trebuchet?!"
    private let lines: [Substring]
    private static let words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    init(input: String) {
        lines = input.split(whereSeparator: \.isNewline)
    }

    private func calibration(includeWords: Bool) -> Int {
        lines.reduce(0) { total, line in
            var digits: [Int] = []
            for index in line.indices {
                if let value = line[index].wholeNumberValue {
                    digits.append(value)
                } else if includeWords {
                    for (offset, word) in Self.words.enumerated() where line[index...].hasPrefix(word) {
                        digits.append(offset + 1)
                    }
                }
            }
            guard let first = digits.first, let last = digits.last else { return total }
            return total + first * 10 + last
        }
    }

    func part1() async -> Int { calibration(includeWords: false) }
    func part2() async -> Int { calibration(includeWords: true) }
}

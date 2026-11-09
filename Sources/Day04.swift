//
// Advent of Code 2023 Day 4
// https://adventofcode.com/2023/day/4
//

import AoCTools

final class Day04: AdventOfCodeDay {
    let title = "Scratchcards"
    private let matchCounts: [Int]

    init(input: String) {
        matchCounts = input.split(whereSeparator: \.isNewline).map(Self.countMatches)
    }

    private static func countMatches(_ card: Substring) -> Int {
        let cardParts = card.split(separator: ":", maxSplits: 1)
        precondition(cardParts.count == 2, "Expected a colon after the card label.")

        let numberLists = cardParts[1].split(
            separator: "|",
            maxSplits: 1,
            omittingEmptySubsequences: false
        )
        precondition(numberLists.count == 2, "Expected a pipe between the number lists.")

        let winningNumbers = Set(String(numberLists[0]).integers())
        let yourNumbers = Set(String(numberLists[1]).integers())
        return winningNumbers.intersection(yourNumbers).count
    }

    func part1() async -> Int {
        matchCounts.lazy.filter { $0 > 0 }.map { 1 << ($0 - 1) }.sum()
    }

    func part2() async -> Int {
        var copies = Array(repeating: 1, count: matchCounts.count)

        for (index, matches) in matchCounts.enumerated() {
            let firstWonIndex = index + 1
            let endIndex = min(firstWonIndex + matches, copies.count)
            let currentCopies = copies[index]

            // Every copy of this card wins the same following cards.
            for wonIndex in firstWonIndex..<endIndex {
                copies[wonIndex] += currentCopies
            }
        }

        return copies.sum()
    }
}

// Advent of Code 2023 Day 2: Cube Conundrum
// https://adventofcode.com/2023/day/2

import AoCTools

final class Day02: AdventOfCodeDay {
    let title = "Cube Conundrum"

    private struct Game {
        let id: Int
        let maxima: [String: Int]
    }
    private let games: [Game]

    init(input: String) {
        games = input.split(whereSeparator: \.isNewline).compactMap { line in
            let pieces = line.split(separator: ":", maxSplits: 1)
            guard pieces.count == 2, let id = pieces[0].split(separator: " ").last.flatMap({ Int($0) }) else {
                return nil
            }
            var maxima: [String: Int] = [:]
            for draw in pieces[1].split(whereSeparator: { $0 == ";" || $0 == "," }) {
                let fields = draw.split(whereSeparator: \.isWhitespace)
                guard fields.count == 2, let count = Int(fields[0]) else { continue }
                let color = String(fields[1])
                maxima[color] = max(maxima[color, default: 0], count)
            }
            return Game(id: id, maxima: maxima)
        }
    }

    func part1() async -> Int {
        let limits = ["red": 12, "green": 13, "blue": 14]
        return games
            .filter { game in
                game.maxima.allSatisfy { color, count in count <= limits[color, default: 0] }
            }
            .reduce(0) { $0 + $1.id }
    }

    func part2() async -> Int {
        games.reduce(0) { total, game in
            total + game.maxima["red", default: 0] * game.maxima["green", default: 0] * game.maxima["blue", default: 0]
        }
    }
}

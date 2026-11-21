//
// Advent of Code 2023 Day 5
//
// https://adventofcode.com/2023/day/5
//

import AoCTools

private struct SeedPipeline {
    private let seeds: [Int]
    private let categorySteps: [CategoryStep]

    init(_ lines: [String]) {
        let sections = lines
            .grouped { $0.isEmpty }
            .filter { !$0.isEmpty }

        guard let seedLine = sections.first?.first else {
            seeds = []
            categorySteps = []
            return
        }

        seeds = seedLine.integers()
        categorySteps = sections
            .dropFirst()
            .map(CategoryStep.init)
    }

    func lowestLocation() -> Int {
        seeds
            .map(location)
            .min() ?? 0
    }

    private func location(for seed: Int) -> Int {
        categorySteps.reduce(seed) { currentValue, categoryStep in
            categoryStep.transform(currentValue)
        }
    }
}

private struct CategoryStep {
    private let instructions: [IntervalInstruction]

    init(_ lines: [String]) {
        instructions = lines
            .dropFirst()
            .map(IntervalInstruction.init)
    }

    func transform(_ value: Int) -> Int {
        guard let matchingInstruction = instructions.first(where: { $0.sourceRangeContains(value) }) else {
            return value
        }
        return matchingInstruction.destinationValue(for: value)
    }
}

private struct IntervalInstruction {
    private let destinationStart: Int
    private let sourceRange: Range<Int>

    init(_ line: String) {
        let values = line.integers()
        precondition(values.count == 3, "Expected destination start, source start, and length.")
        destinationStart = values[0]
        let sourceStart = values[1]
        sourceRange = sourceStart..<(sourceStart + values[2])
    }

    func sourceRangeContains(_ value: Int) -> Bool {
        sourceRange.contains(value)
    }

    func offsetFromSourceStart(for value: Int) -> Int {
        value - sourceRange.lowerBound
    }

    func destinationValue(for value: Int) -> Int {
        destinationStart + offsetFromSourceStart(for: value)
    }
}

final class Day05: AdventOfCodeDay {
    let title = "If You Give A Seed A Fertilizer"
    private let seedPipeline: SeedPipeline

    init(input: String) {
        seedPipeline = SeedPipeline(input.lines)
    }

    func part1() async -> Int {
        seedPipeline.lowestLocation()
    }

    func part2() async -> Int {
        0
    }
}

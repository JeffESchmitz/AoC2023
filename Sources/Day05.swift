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

    func lowestLocationForRanges() -> Int {
        let seedRanges = Self.seedRanges(from: seeds)
        return categorySteps
            .reduce(seedRanges) { currentRanges, categoryStep in
                categoryStep.transformRanges(currentRanges)
            }
            .map(\.lowerBound)
            .min() ?? 0
    }

    private func location(for seed: Int) -> Int {
        categorySteps.reduce(seed) { currentValue, categoryStep in
            categoryStep.transform(currentValue)
        }
    }

    private static func seedRanges(from seeds: [Int]) -> [Range<Int>] {
        precondition(seeds.count.isMultiple(of: 2), "Expected seed starts and lengths in pairs.")
        return stride(from: 0, to: seeds.count, by: 2).map { index in
            let start = seeds[index]
            return start..<(start + seeds[index + 1])
        }
    }
}

private struct CategoryStep {
    private let instructions: [IntervalInstruction]

    init(_ lines: [String]) {
        instructions = lines
            .dropFirst()
            .map(IntervalInstruction.init)
            .sorted { $0.sourceRange.lowerBound < $1.sourceRange.lowerBound }
    }

    func transform(_ value: Int) -> Int {
        guard let matchingInstruction = instructions.first(where: { $0.sourceRangeContains(value) }) else {
            return value
        }
        return matchingInstruction.destinationValue(for: value)
    }

    func transformRanges(_ inputRanges: [Range<Int>]) -> [Range<Int>] {
        inputRanges.flatMap(transformRange)
    }

    private func transformRange(_ inputRange: Range<Int>) -> [Range<Int>] {
        var transformedRanges: [Range<Int>] = []
        var cursor = inputRange.lowerBound

        for instruction in instructions {
            guard instruction.sourceRange.upperBound > cursor else { continue }
            guard instruction.sourceRange.lowerBound < inputRange.upperBound else { break }

            if cursor < instruction.sourceRange.lowerBound {
                transformedRanges.append(cursor..<instruction.sourceRange.lowerBound)
                cursor = instruction.sourceRange.lowerBound
            }

            let mappedUpperBound = min(inputRange.upperBound, instruction.sourceRange.upperBound)
            if cursor < mappedUpperBound {
                transformedRanges.append(
                    instruction.destinationRange(for: cursor..<mappedUpperBound)
                )
                cursor = mappedUpperBound
            }
        }

        if cursor < inputRange.upperBound {
            transformedRanges.append(cursor..<inputRange.upperBound)
        }

        return transformedRanges
    }
}

private struct IntervalInstruction {
    private let destinationStart: Int
    let sourceRange: Range<Int>

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

    func destinationRange(for values: Range<Int>) -> Range<Int> {
        let destinationLowerBound = destinationValue(for: values.lowerBound)
        let destinationUpperBound = destinationStart
            + values.upperBound
            - sourceRange.lowerBound
        return destinationLowerBound..<destinationUpperBound
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
        seedPipeline.lowestLocationForRanges()
    }
}

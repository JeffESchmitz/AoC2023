//
// Tests for the local `fastIntegers()` extension.
// Each case is checked against AoCTools' `integers()` so the two stay in step.
//

import AoCTools
import Testing
@testable import AdventOfCode

@Suite("fastIntegers Tests")
struct FastIntegersTests {
    @Test("Matches AoCTools integers()", arguments: [
        "1,2,3",
        "1 red -2 blue 3green",
        "Game 1: 1 red, 2 bluem 3 green; 4 yellow",
        "1-2",
        "a-5",
        "--3",
        "x 12 -7 - 8",
        "",
        "-",
        "Card  12:  7  3 81 | 81  7 44  2",
        "9223372036854775807 -9223372036854775808",
    ])
    func matchesIntegers(_ text: String) {
        #expect(text.fastIntegers() == text.integers())
    }

    // Deliberate difference: integers() backtracks and splits an oversized digit
    // run ("99999999999999999999 4" → [999999999999999999, 99, 4]); we skip it.
    @Test("Expected values, including overflow skipping")
    func expectedValues() {
        #expect("1 red -2 blue 3green".fastIntegers() == [1, -2, 3])
        #expect("x 12 -7 - 8".fastIntegers() == [12, -7, 8])
        #expect("-9223372036854775808".fastIntegers() == [Int.min])
        #expect("99999999999999999999 4".fastIntegers() == [4])
    }

    @Test("Works on Substring without copying")
    func substring() {
        let card = "Card 1: 41 48 | 83 86"
        let numbers = card.split(separator: ":")[1]
        #expect(numbers.fastIntegers() == [41, 48, 83, 86])
    }
}

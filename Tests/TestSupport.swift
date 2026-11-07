//
// Advent of Code 2023 Test Support
//

import Testing

/// Checks a computed answer against the expected one.
///
/// While `expected` is still `nil`, the test fails and reports the computed
/// answer, so a placeholder can never pass by accident.
func expectAnswer<T: Equatable & Sendable>(
    _ actual: T,
    _ expected: T?,
    sourceLocation: SourceLocation = #_sourceLocation
) {
    guard let expected else {
        Issue.record("No expected answer yet. Computed: \(actual)", sourceLocation: sourceLocation)
        return
    }
    #expect(actual == expected, sourceLocation: sourceLocation)
}

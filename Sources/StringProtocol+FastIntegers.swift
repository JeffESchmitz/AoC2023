//
// Fast integer extraction, a local alternative to AoCTools' regex-based `integers()`.
// See docs/aoctools-changes.md.
//

extension StringProtocol {
    /// Extracts signed integers in order, like AoCTools' `integers()`, without a regex.
    ///
    /// A `-` directly before a digit is a sign. Only ASCII digits count. A digit run
    /// that doesn't fit in `Int` is skipped; `integers()` instead splits it into
    /// smaller numbers. Works on `Substring` without copying.
    func fastIntegers() -> [Int] {
        var result: [Int] = []
        var value = 0
        var negative = false
        var inNumber = false
        var overflowed = false
        var pendingMinus = false

        for byte in utf8 {
            if byte >= UInt8(ascii: "0") && byte <= UInt8(ascii: "9") {
                if !inNumber {
                    inNumber = true
                    negative = pendingMinus
                    overflowed = false
                    value = 0
                }
                if !overflowed {
                    // Accumulate toward the sign so `Int.min` still fits.
                    let digit = Int(byte - UInt8(ascii: "0"))
                    let (shifted, mulOverflow) = value.multipliedReportingOverflow(by: 10)
                    let (next, addOverflow) = negative
                        ? shifted.subtractingReportingOverflow(digit)
                        : shifted.addingReportingOverflow(digit)
                    overflowed = mulOverflow || addOverflow
                    value = next
                }
                pendingMinus = false
            } else {
                if inNumber && !overflowed {
                    result.append(value)
                }
                inNumber = false
                pendingMinus = byte == UInt8(ascii: "-")
            }
        }
        if inNumber && !overflowed {
            result.append(value)
        }
        return result
    }
}

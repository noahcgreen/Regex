import Foundation


extension NSTextCheckingResult {
    
    var ranges: [Range<Int>?] {
        return (0..<numberOfRanges).map() { index in
            return rangeAt(index).toRange()
        }
    }
    
    func ranges(in string: String) -> [Range<String.Index>?] {
        return ranges.map() { $0 != nil ? string.indices(over: $0!) : nil }
    }
    
    
}


public struct Match {
    
    let string: String
    let result: NSTextCheckingResult
    /// The values corresponding to the capture groups in the matching regular expression.
    public let captures: [String?]
    
    init(string: String, result: NSTextCheckingResult) {
        self.string = string
        self.result = result
        
        captures = result.ranges(in: string).dropFirst().map() { $0 != nil ? string.substring(with: $0!) : nil }
    }
    
    
}


extension Match: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "<Regex.Match: \(captures.count) captures>"
    }
    
    
}

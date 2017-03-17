import Foundation


public extension RegularExpression {
    
    func numberOfMatches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> Int {
        return regularExpression.numberOfMatches(in: string, options: options, range: NSRange(string.range))
    }
    
    func enumerateMatches(
        in string: String,
        options: NSRegularExpression.MatchingOptions = [],
        using handleEnumeration: (MatchEnumeration) -> Void
        ) {
        regularExpression.enumerateMatches(in: string, options: options, range: NSRange(string.range)) { (result, flags, stop) in
            let match = Match(string: string, result: result!)
            let progress = MatchEnumeration.Progress(flags: flags, stop: { stop.pointee = true })
            let enumeration = MatchEnumeration(match: match, progress: progress)
            handleEnumeration(enumeration)
        }
    }
    
    func matches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> [Match] {
        let results = regularExpression.matches(in: string, options: options, range: NSRange(string.range))
        return results.map() { Match(string: string, result: $0) }
    }
    
    func firstMatch(in string: String, options: NSRegularExpression.MatchingOptions = []) -> Match? {
        let result = regularExpression.firstMatch(in: string, options: options, range: NSRange(string.range))
        return result != nil ? Match(string: string, result: result!) : nil
    }
    
    func rangeOfFirstMatch(in string: String, options: NSRegularExpression.MatchingOptions = []) -> Range<Int> {
        return regularExpression.rangeOfFirstMatch(in: string, options: options, range: NSRange(string.range)).toRange()!
    }
    
    
}

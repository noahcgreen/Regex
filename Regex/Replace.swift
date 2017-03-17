import Foundation


public extension RegularExpression {
    
    func replaceMatches(
        in string: inout String,
        options: NSRegularExpression.MatchingOptions = [],
        range: Range<Int>? = nil,
        with template: String
        ) {
        let range = range ?? 0..<string.characters.count
        
        let nsString = NSMutableString(string: string)
        regularExpression.replaceMatches(in: nsString, options: options, range: NSRange(range), withTemplate: template)
        string = nsString as String
    }
    
    func stringByReplacingMatches(
        in string: String,
        options: NSRegularExpression.MatchingOptions = [],
        with template: String
        ) -> String {
        return regularExpression.stringByReplacingMatches(
            in: string,
            options: options,
            range: NSRange(string.range),
            withTemplate: template
        )
    }
    
    
}


public extension String {
    
    func replacingMatches(
        of regularExpression: RegularExpression,
        options: NSRegularExpression.MatchingOptions = [],
        with template: String
        ) -> String {
        return regularExpression.stringByReplacingMatches(in: self, options: options, with: template)
    }
    
    
}


public extension RegularExpression {
    
    public func replacementString(for match: Match, in string: String, offset: Int, template: String) -> String {
        return regularExpression.replacementString(for: match.result, in: string, offset: offset, template: template)
    }
    
    
}

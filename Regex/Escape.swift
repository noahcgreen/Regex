import Foundation


public extension RegularExpression {
    
    /// Returns a string with template metacharacters escaped.
    static func escapedTemplate(for string: String) -> String {
        return NSRegularExpression.escapedTemplate(for: string)
    }
    
    /// Returns a string with pattern metacharacters escaped.
    static func escapedPattern(for string: String) -> String {
        return NSRegularExpression.escapedPattern(for: string)
    }
    
    
}

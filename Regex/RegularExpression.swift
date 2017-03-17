import Foundation


public struct RegularExpression {
    
    let regularExpression: NSRegularExpression
    
    public init(_ pattern: String, options: NSRegularExpression.Options = []) throws {
        regularExpression = try NSRegularExpression(pattern: pattern, options: options)
    }
    
    
}


public extension RegularExpression {
    
    public var pattern: String {
        return regularExpression.pattern
    }
    
    public var options: NSRegularExpression.Options {
        return regularExpression.options
    }
    
    public var numberOfCaptureGroups: Int {
        return regularExpression.numberOfCaptureGroups
    }
    
    
}


extension RegularExpression: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return "<RegularExpression: \(pattern)>"
    }
    
    
}


extension RegularExpression: ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringLiteral {
    
    public init(unicodeScalarLiteral value: String) {
        self = try! RegularExpression(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = try! RegularExpression(value)
    }
    
    public init(stringLiteral value: String) {
        self = try! RegularExpression(value)
    }
    
    
}


#if swift(>=4.0)

#else

    extension RegularExpression: ExpressibleByStringInterpolation {
        
        public init(stringInterpolation strings: RegularExpression...) {
            let pattern = strings.map({ $0.pattern }).joined()
            self = try! RegularExpression(pattern)
        }
        
        public init<T>(stringInterpolationSegment expr: T) {
            let stringValue = String(describing: expr)
            self = try! RegularExpression(stringValue, options: .ignoreMetacharacters)
        }
        
  
    }

#endif

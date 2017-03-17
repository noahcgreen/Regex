import Foundation


public struct MatchEnumeration {
    
    public struct Progress {
        
        public let flags: NSRegularExpression.MatchingFlags
        public let stop: () -> Void
        
        
    }
    
    public let match: Match
    public let progress: Progress
    
    
}

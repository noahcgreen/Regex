import Foundation


extension String {
    
    /// Returns a range of indices corresponding to those in the given range.
    func indices(over range: Range<Int>) -> Range<Index> {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return start..<end
    }
    
    /// A range corresponding to the string's entire range of indices.
    var range: Range<Int> {
        return 0..<characters.count
    }
    
    
}

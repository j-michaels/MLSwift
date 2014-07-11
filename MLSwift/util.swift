//
//  util.swift
//  MLSwift
//
//  Created by Joseph Michaels on 6/29/14.
//  Copyright (c) 2014 Joseph Michaels. All rights reserved.
//

import Foundation

operator prefix ~! {}

@prefix func ~!(pattern: String) -> NSRegularExpression {
    return NSRegularExpression(pattern: pattern, options: nil, error: nil)
}

operator prefix ~ {}

@prefix func ~(pattern: String) -> NSRegularExpression {
    return NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
}

extension Array {
    func each(block: T -> ()) -> Array<T> {
        for item in self {
            block(item)
        }
        return self
    }
    
    func eachWithIndex(block: (T, Int) -> ()) -> Array<T> {
        var index = 0
        for item in self {
            block(item, index)
            index++
        }
        return self
    }
    
    func last() -> T? {
        if self.endIndex > self.count {
            return nil
        } else {
            return self[self.endIndex]
        }
    }
    
    func first() -> T? {
        if self.count > 0 {
            return self[self.startIndex]
        } else {
            return nil
        }
    }
}

extension String {
    // Convenience method for getting regular expression captures
    func matches(regex: NSRegularExpression) -> Array<String>? {
        var captures = Array<String>()
        let matches = regex.matchesInString(self, options: nil, range: NSMakeRange(0, countElements(self))) as Array<NSTextCheckingResult>
        
        for match in matches {
            for var i = 1; i < match.numberOfRanges; ++i {
                let r = match.rangeAtIndex(i)
                //match.ra
                // let r2 = Range<String.Index>()
                let subStart = advance(self.startIndex, r.location, self.endIndex)
                let subEnd = advance(subStart, r.length, self.endIndex)
                captures.append(self.substringWithRange(Range(start: subStart, end: subEnd)))
                //captures.append(self.substr)
            }
        }
        return captures
    }
    
    // returns the first match, or nil if there are none
    func firstMatch(regex: NSRegularExpression) -> String? {
        let matches = self.matches(regex)
        if matches {
            return matches![0]
        } else {
            return nil
        }
    }
    
    // Methods for ranges, because Apple hasn't really implemented them yet
    subscript (r: Range<Int>) -> String {
        get {
            let subStart = advance(self.startIndex, r.startIndex, self.endIndex)
            let subEnd = advance(subStart, r.endIndex - r.startIndex, self.endIndex)
            return self.substringWithRange(Range(start: subStart, end: subEnd))
        }
    }
    func substring(from: Int) -> String {
        let end = countElements(self)
        return self[from..<end]
    }
    func substring(from: Int, length: Int) -> String {
        let end = from + length
        return self[from..<end]
    }
}
// Playground - noun: a place where people can play

import Cocoa
import Accelerate

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
        if captures.count > 0 {
            return captures
        } else {
            return nil
        }
    }
    
    // returns the first match, or nil if there are none
    func firstMatch(regex: NSRegularExpression) -> String? {
        let matches = self.matches(regex)
        if matches != nil {
            return matches![0]
        } else {
           return nil
        }
    }
}

var s = "foobar" as NSString

s.substringWithRange(NSMakeRange(0, 2))

var x = CDouble[](1...3)

var v = x

var y = CDouble[](count: Int(3), repeatedValue: 0)

x

var a = [0, 0, 0,
    1, 0, 2,
    3, 0, 1].map { (i) in CDouble(i) }

var c = [5,3,21,2]
var test1 = 0
c.map { (i: Int) -> (Int, Int) in
    test1++
    return (i, test1)
}

let filename = "/Users/jmichaels/Repositories/MachineLearning/hmm.txt"

//let lines = String.stringWithContentsOfFile(filename, encoding: NSUTF8StringEncoding, error: nil)

//for line in lines!.componentsSeparatedByString("\r\n") {
    
//}

let newHMMLine = "~h \"mo\""
let stateLine = "<STATE> 5"

let stateRegex = ~"<STATE> ([0-9])"

stateLine.firstMatch(~"f")
newHMMLine.firstMatch(~"~(.) \"(.+)\"")



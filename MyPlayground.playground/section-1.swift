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

let stateLine = "<STATE> 5foo"



let match = stateLine.rangeOfString("<STATE> ([0-9])", options: .RegularExpressionSearch)


let stateRegex = ~"<STATE> ([0-9])"

//stateRegex.matchesInString(stateLine, options: nil, range: nil)

let result = stateRegex.firstMatchInString(stateLine, options: nil, range: NSMakeRange(0, countElements(stateLine)))

result.rangeAtIndex(1)

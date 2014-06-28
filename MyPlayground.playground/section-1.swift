// Playground - noun: a place where people can play

import Cocoa
import Accelerate

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


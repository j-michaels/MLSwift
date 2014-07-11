// Playground - noun: a place where people can play

import Cocoa

operator infix |> { associativity left }
func |> <T,U>(lhs : T, rhs : T -> U) -> U {
    return rhs(lhs)
}

class Foo<U,T> {
    var zap: U
    var bar: T
    init(zap:U, bar:T) {
        self.zap = zap
        self.bar = bar
    }
}

class Baz<T>: Foo<T,T> {
    init(zap:T, bar: T) {
        super.init(zap: zap, bar: bar)
    }
}

let a = 1

var b = Baz<Int>(zap: 2, bar: 1)
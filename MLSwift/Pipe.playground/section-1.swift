// Playground - noun: a place where people can play

import Cocoa

operator infix |> { associativity left }
func |> <T,U>(lhs : T, rhs : T -> U) -> U {
    return rhs(lhs)
}
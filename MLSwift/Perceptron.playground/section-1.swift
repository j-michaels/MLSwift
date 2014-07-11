// Playground - noun: a place where people can play

import Cocoa

extension Array {
//    func eachWithIndex(block: (T, Int) -> ()) -> Array<T> {
//        var index = 0
//        for item in self {
//            block(item, index)
//            index++
 //       }
 //       return self
 //   }
    
    func mapWithIndex<F>(block: (T, Int) -> F) -> Array<F> {
        var index = 0
        var resultArray = Array<F>()
        
        for item in self {
            resultArray.append(block(item, index))
            index++
        }
        return resultArray
    }
}

class Perceptron {
    var inputs: Array<Float>
    var weights: Array<Float>
    var bias = 0
    
    init(inputs: Array<Float>, weights: Array<Float>) {
        self.inputs = inputs
        self.weights = weights
    }
    
    func run() -> Array<Float> {
        var output = Array<Float>()
        output = inputs.mapWithIndex {(v: Float, i: Int) -> Float in
            v * self.weights[i]
        }
        return output
    }
}

func sum(vals: Array<Float>) -> Float {
    var total: Float = 0.0
    for val in vals {
        total += val
    }
    return total
}


var a: Array<Float> = [1,2]
var p = Perceptron(inputs: a, weights: [0.2, 0.4])
p.weights = [1, 3]
p.run()
let af = [1.0, 2.3, 9.1] as Array<Float>
sum(af)


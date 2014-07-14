//
//  matrix.swift
//  MLSwift
//
//  Created by Joseph Michaels on 6/28/14.
//  Copyright (c) 2014 Joseph Michaels. All rights reserved.
//

import Foundation

// a matrix that uses CFloats for its data structure
// this is useful for dealing with libraries such as BLAS that need CFloats
// but your project needs Doubles
class FloatMatrix {
    var data: Array<CFloat> = []
    var m: Int = 0
    var n: Int = 0
    
    init(diagonal: Array<Double>) {
        var index = 0
        for i in diagonal {
            var row = Array<CFloat>(count: diagonal.count, repeatedValue: 0)
            row[index] = CFloat(i)
            data += row
            index++
        }
    }
    
    init(columnVector: Array<Double>) {
        data = columnVector.map { (i) in CFloat(i) }
    }
}
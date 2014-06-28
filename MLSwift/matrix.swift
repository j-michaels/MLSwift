//
//  matrix.swift
//  MLSwift
//
//  Created by Joseph Michaels on 6/28/14.
//  Copyright (c) 2014 Joseph Michaels. All rights reserved.
//

import Foundation

class Matrix {
    var data: CFloat[] = []
    var m: Int = 0
    var n: Int = 0
    
    init(diagonal: Array<Double>) {
        var index = 0
        for i in diagonal {
            var row = CFloat[](count: diagonal.count, repeatedValue: 0)
            row[index] = CFloat(i)
            data += row
            index++
        }
    }
    
    init(columnVector: Array<Float>) {
        data = columnVector.map { (i) in CFloat(i) }
    }
}
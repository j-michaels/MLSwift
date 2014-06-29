//
//  util.swift
//  MLSwift
//
//  Created by Joseph Michaels on 6/29/14.
//  Copyright (c) 2014 Joseph Michaels. All rights reserved.
//

import Foundation

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
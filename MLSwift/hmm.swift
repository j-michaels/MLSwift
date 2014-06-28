//
//  hmm.swift
//  MLSwift
//
//  Created by Joseph Michaels on 6/27/14.
//  Copyright (c) 2014 Joseph Michaels. All rights reserved.
//

import Foundation

operator infix ** {}

func ** (num: Double, power: Double) -> Double {
    return pow(num, power)
}



struct Mixture {
    var weight: Matrix
    
}

class State {
    var mixtures = Array<Dictionary<String, Any>>()
    var currentMixture = Dictionary<String, Any>()
    
    func switchNewMixture(weight: Int) {
        currentMixture = ["weight": weight]
        mixtures.append(currentMixture)
    }
    
    func setCurrentMean(mean: Int) {
        // make sure that later when this is used, it's converted to a column vector
        currentMixture["mean"] = mean
    }
    
    func setMixtureMeanTotal(total: Int) {
        currentMixture["mean total"] = total
    }
    
    func weightedPDF(x: Int) {
        var i = 0
        for mixture in mixtures {
            let mean = mixture["mean"]
            let inverse_variance = mixture["inverse variance"]
            let denominator = mixture["denominator"]
            //let x_mu_diff = (x - mean)
            
        }
        
    }
}

class HMM {
    
}

class SentenceHMM: HMM {
    init() {
        
    }
}

class ModelManager {
    
}
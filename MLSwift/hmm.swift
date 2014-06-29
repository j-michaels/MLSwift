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

class Mixture {
    var weight: Int
    var variance = Matrix()
    var mean = Matrix()
    var inverseVariance = Matrix()
    var denominator = 1
    
    init(weight: Int) {
        self.weight = weight
    }
}

class State {
    var mixtures = Array<Mixture>()
    var currentMixture: Mixture?
    
    init() {

    }
    
    func switchNewMixture(weight: Int) {
        currentMixture = Mixture(weight: weight)
        mixtures.append(currentMixture!)
    }
    
    func setCurrentMean(mean: Matrix) {
        // make sure that later when this is used, it's converted to a column vector
        //currentMixture.mean = mean
    }
    
    func setMixtureMeanTotal(total: Int) {
        //currentMixture["mean total"] = total
    }
    
    func setMixtureVariance(variance: Any) {
        
    }
    
    func weightedPDF(x: Int) {
        var i = 0
        for mixture in mixtures {
            let mean = mixture.mean
            let inverse_variance = mixture.inverseVariance
            let denominator = mixture.denominator
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
    var models = Dictionary<String, HMM>()
    var currentModel: HMM? = nil
    
    init() {
        let text = String.stringWithContentsOfFile("foo", encoding: NSUTF8StringEncoding, error: nil)
        if (text != nil) {
            for line in text!.componentsSeparatedByString("\n") {
                let paramRegex = ~"<([A-Z]+)> ([0-9])"
                let newHMMRegex = ~"~(.) \"(.+)\""
                
                if let match = line.matches(newHMMRegex) {
                    let name = match.last()
                    if name != nil {
                        currentModel = HMM()
                        models[name!] = currentModel
                    }
                } else if let match = line.matches(paramRegex) {
                    let param = match.first()
                    let value = match.last()
                    if (param && value && currentModel) {
                        
                    }
                } else {
                    if (currentModel) {
                        
                    }
                }
            }
        }
    }
}
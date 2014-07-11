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
    var weight: Double
    var variance = FloatMatrix()
    var mean = FloatMatrix()
    var inverseVariance = FloatMatrix()
    var denominator = 1
    
    init(weight: Double) {
        self.weight = weight
    }
}

class State {
    var mixtures = Array<Mixture>()
    var currentMixture: Mixture? = nil
    
    init() {

    }
    
    func switchNewMixture(weight: Double) {
        currentMixture = Mixture(weight: weight)
        mixtures.append(currentMixture!)
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
    var states = Array<Array<Mixture>>()
    var stateTransitions = FloatMatrix()
    var currentMixture: Mixture?
    
    // add to the state transitions
    func addTransitions(transitions: Array<Double>) {
        // do something
    }
    
    // creates a mixture on the last created state
    func newMixture(value: Double) {
        var mix = Mixture(weight: value)
        var state: Array<Mixture> = [mix]
        states.append(state)
    }
    
    // sets the mean of the last created mixture
    func setMean(mean: FloatMatrix) {
        // make sure that later when this is used, it's converted to a column vector
        if currentMixture {
            currentMixture!.mean = mean
        }
        
    }
    
    func setMeanTotal(total: Int) {
        //currentMixture["mean total"] = total
    }
    
    func setVariance(variance: FloatMatrix) {
        
    }
    
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
                var lastParam = ""
                var initial = Array<Double>()
                
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
                        // set the value for the current model
                        
                        switch (param!) {
                        case "MIXTURE":
                            currentModel?.newMixture(value!.bridgeToObjectiveC().doubleValue)
                            //currentModel!.newMixture(v.toInt())
                        default:
                            let foo = "bar"
                        }
                    }
                } else {
                    // update last
                    if (currentModel) {
                        let data = line.componentsSeparatedByString(" ").map { val in
                            val.bridgeToObjectiveC().doubleValue
                        }
                        switch (lastParam) {
                        case "VARIANCE":
                            let variance = FloatMatrix(diagonal: data)
                            currentModel?.setVariance(variance)
                        case "MEAN":
                            let mean = FloatMatrix(columnVector: data)
                            currentModel?.setMean(mean)
                        case "TRANSP":
                            if (initial.count == 0) {
                                initial = data
                            } else {
                                currentModel?.addTransitions(data)
                            }
                        default:
                            let foo = "bar"
                        }
                    }
                }
            }
        }
    }
}
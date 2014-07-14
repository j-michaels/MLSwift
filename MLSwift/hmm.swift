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
    var weight: Double
    var variance: FloatMatrix?
    var mean: FloatMatrix?
    var inverseVariance: FloatMatrix?
    var denominator: Double?
    
    init(weight: Double) {
        self.weight = weight
    }
}

class HMM {
    var states = Array<Array<Mixture>>()
    var stateTransitions = Array<Array<Double>>()
    var currentMixture: Mixture?
    
    // add to the state transitions
    func addTransitions(transitions: Array<Double>) {
        // do something
        stateTransitions.append(transitions)
    }
    
    // creates a mixture on the last created state
    func newMixture(value: Double) {
        // this is wrong I think
        var mix = Mixture(weight: value)
        var state: Array<Mixture> = [mix]
        states.append(state)
    }
    
    // sets the mean of the last created mixture
    func setMean(mean: FloatMatrix) {
        // make sure that later when this is used, it's converted to a column vector
        if var mixture = currentMixture {
            mixture.mean = mean
        }
        
    }
    
    func setMeanTotal(total: Int) {
        //currentMixture["mean total"] = total
    }
    
    func setVariance(variance: FloatMatrix) {
        
    }
    
    func weightedPDF(stateIndex: Int, input: Int) {
        var i = 0
        for mixture in states[stateIndex] {
            let mean = mixture.mean
            let inverse_variance = mixture.inverseVariance
            let denominator = mixture.denominator
            //let x_mu_diff = (x - mean)
        }
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
                let paramRegex = ~"<([A-Z]+)> (.+)"
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
                    
                    if let model = currentModel {
                        // set the value for the current model
                        if param && value {
                        // need to select the second part of value?
                            switch (param!) {
                            case "MIXTURE":
                                if let v = value!.componentsSeparatedByString(" ").map({ (s: String) in s.bridgeToObjectiveC().doubleValue }).last() {
                                    model.newMixture(value!.bridgeToObjectiveC().doubleValue)
                                }
                                //currentModel!.newMixture(v.toInt())
                            default:
                                let foo = "bar"
                            }
                        }
                    }
                } else {
                    // Doesn't match either the "New markov model" regex or the
                    // HMM parameter regex, so it must be additional data for the
                    // last parameter
                    if let model = currentModel {
                        let data = line.componentsSeparatedByString(" ").map { val in
                            val.bridgeToObjectiveC().doubleValue
                        }
                        switch (lastParam) {
                        case "VARIANCE":
                            let variance = FloatMatrix(diagonal: data)
                            model.setVariance(variance)
                        case "MEAN":
                            let mean = FloatMatrix(columnVector: data)
                            model.setMean(mean)
                        case "TRANSP":
                            if (initial.count == 0) {
                                initial = data
                            } else {
                                model.addTransitions(data)
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
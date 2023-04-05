//
//  GenerateSolutionSteps.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 03/04/23.
//

import Foundation

typealias FractionSolutions = (steps: [Any], isDenominatorEqual: Bool, canBeSimplified:Bool)
typealias TimesFactors = (t1:Int, t2:Int)
typealias SimplifyProperties = (operationResult: Fraction, fpb: Int)

func generateSolutionSteps(f1:Fraction, f2:Fraction, operand:Operand) -> FractionSolutions {
    let isDenominatorEqual:Bool = checkIfFractionValEqual(deci1: f1.decimal, deci2: f2.decimal)
    var canBeSimplified:Bool = false
    
    var fraction1:Fraction = f1
    var fraction2:Fraction = f2
    
    var steps:[Any] = []
    
    if !isDenominatorEqual {
        let kpk = getKPK(num1: f1.denominator, num2: f2.denominator)
        let timesFactorF1 = calculateTimesFactor(num: f1.denominator, kpk: kpk)
        let timesFactorF2 = calculateTimesFactor(num: f2.denominator, kpk: kpk)
        
        steps.append((t1:timesFactorF1, t2:timesFactorF2))
        
        fraction1 = multiplyFractionNotations(fraction: f1, timesFactor: timesFactorF1)
        fraction2 = multiplyFractionNotations(fraction: f2, timesFactor: timesFactorF2)
    }
    
    steps.append((f1:fraction1, f2:fraction2))
    
    let operationResult = calculateFractionsOperation(f1: fraction1, f2: fraction2, operand: operand)
    let fpb = getFPB(num1: operationResult.numerator, num2: operationResult.denominator)
    
    if let fpb = fpb {
        canBeSimplified = true
        steps.append((operationResult: operationResult, fpb: fpb))
    }
    
    return (steps, isDenominatorEqual, canBeSimplified)
}

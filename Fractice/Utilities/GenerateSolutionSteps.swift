//
//  GenerateSolutionSteps.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 03/04/23.
//

import Foundation

typealias FractionSolutions = (steps: [Any], isDenominatorEqual: Bool, canBeSimplified:Bool)
typealias FinalAnswer = (operationResult:Fraction,operand:Operand)
typealias TimesFactors = (t1:Int, t2:Int)
typealias SimplifyProperties = (operationResult: Fraction, fpb: Int, result:Fraction)

func generateSolutionSteps(f1:Fraction, f2:Fraction, operand:Operand) -> FractionSolutions {
    // index
    // 0    hasil times factor (penyebut bedaa)
    // 0    fraction yang sama (penyebut sama)
    // 1    hasil hitung dengan times factor (penyebut beda)
    // 1    hasil hitung pecahan  (penyebut sama)
    // 2    hasil hitung pecahan setelah penyebut sama (penyebut beda)
    // 2    sederhanakan pecahan kalau bisa ( penyebut sama)
    // 3    sederhanakan pecahan kalaui bisa (penyebut beda)
    let isDenominatorEqual:Bool = checkIfDenominatorEqual(deno1: f1.denominator, deno2: f2.denominator)
    var canBeSimplified:Bool = false
    
    var fraction1:Fraction = f1
    var fraction2:Fraction = f2
    
    var steps:[Any] = []
    
    // penyebut beda
    if !isDenominatorEqual {
        let kpk = getKPK(num1: f1.denominator, num2: f2.denominator)
        let timesFactorF1 = calculateTimesFactor(num: f1.denominator, kpk: kpk)
        let timesFactorF2 = calculateTimesFactor(num: f2.denominator, kpk: kpk)
        
        // step 1
        steps.append((t1:timesFactorF1, t2:timesFactorF2))
        
        fraction1 = multiplyFractionNotations(fraction: f1, timesFactor: timesFactorF1)
        fraction2 = multiplyFractionNotations(fraction: f2, timesFactor: timesFactorF2)
        // step 2
        steps.append((f1:fraction1, f2:fraction2))
        // step 3
        let operationResult = calculateFractionsOperation(f1: fraction1, f2: fraction2, operand: operand)
        steps.append((operationResult:operationResult, operand:operand))
        
    }
    else{
        // step 1
        steps.append((f1:fraction1, f2:fraction2))
        // step 2
        let operationResult = calculateFractionsOperation(f1: fraction1, f2: fraction2, operand: operand)
        steps.append((operationResult:operationResult, operand:operand))
        
        
    }
    
   
    // step 4(penyebut beda) step 3 (penyebut sama)
    let operationResult = calculateFractionsOperation(f1: fraction1, f2: fraction2, operand: operand)
    let fpb = getFPB(num1: operationResult.numerator, num2: operationResult.denominator)
    if let fpb = fpb {
        let numeratorSimplified = operationResult.numerator / fpb
        let denominatorSimplified = operationResult.denominator / fpb
        let decimalSimplified = convertFractionToDecimal(numerator:numeratorSimplified, denominator: denominatorSimplified)
        let answer:Fraction = Fraction(numerator:numeratorSimplified, denominator:denominatorSimplified, decimal: decimalSimplified)
        
        canBeSimplified = true
        
       
        
        steps.append((operationResult: operationResult, fpb: fpb, result: answer))
    }
    
    return (steps, isDenominatorEqual, canBeSimplified)
}

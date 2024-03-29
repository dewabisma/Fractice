//
//  GenerateFraction.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

typealias Fraction = (numerator:Int, denominator:Int, decimal: Double)
typealias FractionPair = (f1:Fraction, f2: Fraction)

func convertFractionToDecimal(numerator:Int, denominator:Int) -> Double {
    let nume = Double(numerator)
    let deno = Double(denominator)
    
    return nume / deno
}

func multiplyFractionNotations(fraction:Fraction, timesFactor:Int) -> Fraction {
    let newNum = fraction.numerator * timesFactor
    let newDen = fraction.denominator * timesFactor
    let newDeci = convertFractionToDecimal(numerator: newNum, denominator: newDen)
    
    return (newNum, newDen, newDeci)
}

func finalAnswer (f1: Fraction, f2: Fraction, operand: Operand) -> Fraction {
    
    var finalAns: Fraction
    
    switch (operand) {
    case .plus:
        finalAns = convertDecimalToFraction(decimalVal: f1.decimal + f2.decimal)
        
    case .minus:
        finalAns = convertDecimalToFraction(decimalVal: f1.decimal - f2.decimal)
    }
    
    return (finalAns)
}

func calculateFractionsOperation(f1:Fraction, f2:Fraction, operand:Operand) -> Fraction {
    var resultNum:Int
    
    switch(operand) {
        case .plus:
            resultNum = f1.numerator + f2.numerator
        case .minus:
            resultNum = f1.numerator - f2.numerator
    }
    
    let resultDeci = convertFractionToDecimal(numerator: resultNum, denominator: f1.denominator)
    
    return (resultNum, f1.denominator, resultDeci)
}

func generateFraction(maxVal:Int = 10) -> Fraction {
    let numerator = Int.random(in: 1..<maxVal)
    var denominator:Int
    
    if numerator == maxVal - 1 {
        denominator = maxVal
        
        let deci = convertFractionToDecimal(numerator: numerator, denominator: denominator)
        
        return (numerator:numerator, denominator:denominator, decimal: deci)
    }
    
    denominator = Int.random(in: numerator+1...maxVal)
    
    let deci = convertFractionToDecimal(numerator: numerator, denominator: denominator)
    
    return (numerator:numerator, denominator:denominator, decimal: deci)
}

func generateFractionPair(maxVal:Int = 10, includeNegative:Bool = false) -> FractionPair {
    var fraction1 = generateFraction(maxVal: maxVal)
    var fraction2 = generateFraction(maxVal: maxVal)
    
    if fraction1.numerator == fraction2.numerator {
        fraction1 = (numerator: fraction1.numerator + 1, denominator: fraction1.denominator, decimal: fraction1.decimal)
    }
    
    if !includeNegative {
        let sortedFraction = sortFraction(operand: Operand.minus, fraction1: fraction1.decimal, fraction2: fraction2.decimal)
        
        fraction1 = convertDecimalToFraction(decimalVal: sortedFraction.f1)
        fraction2 = convertDecimalToFraction(decimalVal: sortedFraction.f2)
    }
    
    return (fraction1, fraction2)
}

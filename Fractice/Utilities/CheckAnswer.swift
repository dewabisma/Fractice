//
//  CheckAnswer.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func checkIfFractionValEqual(deci1:Double, deci2:Double) -> Bool {
    let diff = abs(deci1 - deci2)
    
    return diff.isLess(than: 0.001)
}

func checkIfDenominatorEqual(deno1: Int, deno2: Int) -> Bool {
    return deno1 == deno2
}

func checkAnswer(userAnswer:Double, operand:Operand, f1:Double, f2:Double) -> Bool {
    var problemAnswer: Double
    
    switch (operand) {
        case .plus:
            problemAnswer = f1 + f2
        case .minus:
            problemAnswer = f1 - f2
    }
    
    let isEqual = checkIfFractionValEqual(deci1: userAnswer, deci2: problemAnswer)
    
    return isEqual
}

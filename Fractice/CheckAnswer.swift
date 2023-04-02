//
//  CheckAnswer.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

enum Operand: String {
    case plus = "+"
    case minus = "-"
}

func checkAnswer(userAnswer:Float, operand:Operand, f1:Float, f2:Float) -> Bool {
    var problemAnswer: Float
    
    switch (operand) {
        case .plus:
            problemAnswer = f1 + f2
        case .minus:
            problemAnswer = f1 - f2
    }
    
    let diff = abs(userAnswer - problemAnswer)
    
    return diff.isLess(than: 0.001)
}

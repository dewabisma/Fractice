//
//  GenerateOperand.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 03/04/23.
//

import Foundation

enum Operand:String, CaseIterable {
    case plus = "plus"
    case minus = "minus"
}

func generateOperand() -> Operand {
    let op = Operand.allCases.randomElement()!
    
    return op
}

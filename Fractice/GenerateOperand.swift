//
//  GenerateOperand.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 03/04/23.
//

import Foundation

enum Operand:String, CaseIterable {
    case plus = "+"
    case minus = "-"
}

func generateOperand() -> Operand.RawValue {
    let op = Operand.allCases.randomElement()!.rawValue
    
    return op
}

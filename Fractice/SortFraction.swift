//
//  SortFraction.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func SortFraction(operand:Operand, fraction1:Float, fraction2:Float) -> (Float, Float) {
    var f1 = fraction1
    var f2 = fraction2
    
    if operand == .minus {
        let diff = f1 - f2
        
        f1 = diff < 0 ? f2: f1
        f2 = diff < 0 ? f1: f2
    }
    
    return (f1: f1, f2: f2)
}

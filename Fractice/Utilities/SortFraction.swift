//
//  SortFraction.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func sortFraction(operand:Operand, fraction1:Double, fraction2:Double) -> (f1:Double, f2:Double) {
    var f1 = fraction1
    var f2 = fraction2
    
    if operand == .plus {
        return (f1: f1, f2: f2)
    }
    
    let diff = f1 - f2
    
    if diff < 0 {
        return(f1:f2,f2:f1)
    }
    
    return (f1: f1, f2: f2)
}

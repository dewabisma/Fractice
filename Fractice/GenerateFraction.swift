//
//  GenerateFraction.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func generateFraction(maxVal:Int = 10) -> (numerator:Int, denominator:Int) {
    let numerator = Int.random(in: 1..<maxVal)
    var denominator:Int
    
    if numerator == maxVal - 1 {
        denominator = maxVal
        
        return (numerator:numerator, denominator:denominator)
    }
    
    denominator = Int.random(in: numerator+1...maxVal)
    
    return (numerator:numerator, denominator:denominator)
}

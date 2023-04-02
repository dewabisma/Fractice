//
//  ConvertDecimalToFraction.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

typealias Rational = (numerator : Int, denominator : Int)

func convertDecimalToFraction(decimalVal : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
    var x = decimalVal
    var a = floor(x)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)

    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = floor(x)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return (h, k)
}

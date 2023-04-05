//
//  GetKPK.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func getKPK(num1:Int, num2:Int) -> Int {
    var KPK: Int
    
    let smallerOne = Float(min(num1, num2))
    let biggerOne = Float(max(num1, num2))
    
    let divResult = biggerOne / smallerOne
    let isInteger = divResult.truncatingRemainder(dividingBy: 1) == 0
    
    if isInteger {
        KPK = Int(smallerOne * divResult)
    } else {
        KPK = num1 * num2
    }
    
    return KPK
}

func calculateTimesFactor(num:Int, kpk:Int) -> Int {
    return kpk / num
}

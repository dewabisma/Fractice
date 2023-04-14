//
//  GetKPK.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func getKPK(num1:Int, num2:Int) -> Int {
    var kpk: Int
    let fpb = getFPB(num1: num1, num2: num2)
    
    kpk = (num1 * num2) / fpb
    
    return kpk
}

func calculateTimesFactor(num:Int, kpk:Int) -> Int {
    return kpk / num
}

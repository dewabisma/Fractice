//
//  GetKPK.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func getKPK(num1:Int, num2:Int) -> Int {
    let smallerOne = min(num1, num2)
    let biggerOne = max(num1, num2)
    
    let divResult = biggerOne / smallerOne
    
    print(type(of: divResult))
    
    return 2
}

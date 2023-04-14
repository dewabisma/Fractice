//
//  GetFPB.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import Foundation

func getFactors(_ num:Int) -> [Int] {
    var factors:[Int] = []
    var tempVal = num
    
    while tempVal > 1 {
        for i in 2...tempVal {
            if tempVal % i == 0 {
                factors.append(i)
                tempVal = tempVal / i
                
                break
            }
        }
    }
    
    return factors
}

func getFPB(num1:Int, num2:Int) -> Int {
    var FPB:Int = 1
    var sameFactors:[Int] = []
    
    let factors1 = num1 < num2 ? getFactors(num1) : getFactors(num2)
    var factors2 = num1 < num2 ? getFactors(num2) : getFactors(num1)
    
    for i in 0..<factors1.count {
        for j in 0..<factors2.count {
            let factorA = factors1[i]
            let factorB = factors2[j]
            
            if factorA == factorB {
                sameFactors.append(factorA)
                
                factors2.remove(at: j)
                
                break
            }
        }
    }
    
    if sameFactors.count > 0 {
        FPB = sameFactors.reduce(0) {
            if $0 == 0 {
                return $1
            }
            
            return $0 * $1
        }
    }
    
    return FPB
}

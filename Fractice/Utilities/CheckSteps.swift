//
//  CheckSteps.swift
//  Fractice
//
//  Created by Datita Devindo Bahana on 09/04/23.
//

import Foundation




func checkEqualizeFraction(fractionSolutions:FractionSolutions,pengali1:Int,pengali2:Int) -> Bool{
    
    let solutions = fractionSolutions.steps[0] as! TimesFactors
////    (solution.steps[0] as! TimesFactors).t2)
    if(pengali1 != solutions.t1 || pengali2 != solutions.t2){
        return false
    }
    return true
}

func checkCalculation(fractionSolutions:FractionSolutions,num1:Int,denom1:Int,num2:Int,denom2:Int) -> Bool{
    
    
//    let solutions = fractionSolutions.steps[1] as! FractionPair
    let solutions:FractionPair
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[1] as! FractionPair
    }else{
        solutions = fractionSolutions.steps[0] as! FractionPair
    }
    
    if(num1 != solutions.f1.numerator || denom1 != solutions.f1.denominator || num2 != solutions.f2.numerator || denom2 != solutions.f2.denominator){
        return false
    }
     return true
}

func checkSimplified(fractionSolutions:FractionSolutions,fpb:Int) -> Bool{
    
    let solutions:SimplifyProperties
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[2] as! SimplifyProperties
    }else{
        solutions = fractionSolutions.steps[1] as! SimplifyProperties
    }
    
    if(fpb != solutions.fpb){
        return false
    }
    
    
    return true
}


//
//  CheckSteps.swift
//  Fractice
//
//  Created by Datita Devindo Bahana on 09/04/23.
//

import Foundation


// index
// 0    hasil times factor (penyebut bedaa)
// 0    fraction yang sama (penyebut sama ga perlu dicek)
// 1    hasil hitung dengan times factor (penyebut beda)
// 1    hasil hitung pecahan  (penyebut sama)
// 2    hasil hitung pecahan setelah penyebut sama (penyebut beda)
// 2    sederhanakan pecahan kalau bisa ( penyebut sama)
// 3    sederhanakan pecahan kalaui bisa (penyebut beda)

func checkEqualizeFraction(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Bool{
    
    let solutions = fractionSolutions.steps[0] as! TimesFactors
////    (solution.steps[0] as! TimesFactors).t2)
    if(Int(jawaban.dikali1) != solutions.t1 || Int(jawaban.dikali2) != solutions.t2){
        return false
    }
    return true
}

//func checkCalculateTimesFactor(fractionSolutions:FractionSolutions,pengali1:String="0",pengali2:String="0")->Bool{
//    let solutions = fractionSolutions.steps[1] as! FractionPair
//
//    return true
//}

func checkCalculationTimesFactor(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Bool{
    
    let solutions = fractionSolutions.steps[1] as! FractionPair
    
//    if(!fractionSolutions.isDenominatorEqual){
//        solutions = fractionSolutions.steps[1] as! FractionPair
//    }else{
//        solutions = fractionSolutions.steps[0] as! FractionPair
//    }
    
    if(Int(jawaban.numerator1) != solutions.f1.numerator || Int(jawaban.denominator1) != solutions.f1.denominator || Int(jawaban.numerator2) != solutions.f2.numerator || Int(jawaban.denominator2) != solutions.f2.denominator){
        return false
    }
     return true
}

func checkCalculationFraction(fractionSolutions:FractionSolutions,jawaban:Jawaban,isStepMode:Bool)-> Bool{
//    let solutions = fractionSolutions.steps[2] as! FinalAnswer
    let solutions:FinalAnswer
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[2] as! FinalAnswer
    }else{
        solutions = fractionSolutions.steps[1] as! FinalAnswer
    }

    if isStepMode{
        if(Int(jawaban.numerator3) != solutions.operationResult.numerator || Int(jawaban.denominator3) != solutions.operationResult.denominator){
            return false
        }
    }
    else{
        if(Int(jawaban.numerator) != solutions.operationResult.numerator || Int(jawaban.denominator) != solutions.operationResult.denominator){
            return false
        }
    }
    return true
}

func checkSimplified(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Bool{
    
    let solutions:SimplifyProperties
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[3] as! SimplifyProperties
    }else{
        solutions = fractionSolutions.steps[2] as! SimplifyProperties
    }
    
//    solutions = fractionSolutions.steps[3] as! SimplifyProperties
    
    if(Int(jawaban.dibagi) != solutions.fpb){
        return false
    }
    
    
    return true
}

func checkFinalAnswerSimplified(fractionSolutions:FractionSolutions,jawaban:Jawaban,isStepMode:Bool) -> Bool{
    
    let solutions:SimplifyProperties
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[3] as! SimplifyProperties
    }else{
        solutions = fractionSolutions.steps[2] as! SimplifyProperties
    }
   
//
//    solutions = fractionSolutions.steps[3] as! SimplifyProperties
    let denominator = solutions.operationResult.denominator / solutions.fpb
    let numerator = solutions.operationResult.numerator / solutions.fpb
    
    if isStepMode{
        if Int(jawaban.numerator4) != numerator && Int(jawaban.denominator4) != denominator{
            return false
        }
    }
    else{
        if Int(jawaban.numerator) != numerator && Int(jawaban.denominator) != denominator{
            return false
        }
    }
    
    
    return true
}


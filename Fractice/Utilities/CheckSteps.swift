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

func checkEqualizeFraction(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Jawaban{
    
    let solutions = fractionSolutions.steps[0] as! TimesFactors
    var jawabanTemp = jawaban
    jawabanTemp.isCheckEqualize = true
    jawabanTemp.isDikali1 = true
    jawabanTemp.isDikali2 = true
    
    if(Int(jawaban.dikali1) != solutions.t1 ){
        jawabanTemp.isCheckEqualize = false
        jawabanTemp.isDikali1 = false
//        return jawabanTemp
    }
    if( Int(jawaban.dikali2) != solutions.t2){
        jawabanTemp.isCheckEqualize = false
        jawabanTemp.isDikali2 = false
    }
    return jawabanTemp
//    return true
}

//func checkCalculateTimesFactor(fractionSolutions:FractionSolutions,pengali1:String="0",pengali2:String="0")->Bool{
//    let solutions = fractionSolutions.steps[1] as! FractionPair
//
//    return true
//}

func checkCalculationTimesFactor(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Jawaban{
    
    let solutions = fractionSolutions.steps[1] as! FractionPair
    var jawabanTemp = jawaban
    jawabanTemp.isNumerator1 = true
    jawabanTemp.isDenominator1 = true
    jawabanTemp.isNumerator2 = true
    jawabanTemp.isDenominator2 = true
    jawabanTemp.isCheckCalculationTimesFactor = true
    if(Int(jawaban.numerator1) != solutions.f1.numerator){
        jawabanTemp.isNumerator1 = false
        jawabanTemp.isCheckCalculationTimesFactor = false
    }
    if(Int(jawaban.denominator1) != solutions.f1.denominator){
        jawabanTemp.isDenominator1 = false
        jawabanTemp.isCheckCalculationTimesFactor = false
    }
    if(Int(jawaban.numerator2) != solutions.f2.numerator){
        jawabanTemp.isNumerator2 = false
        jawabanTemp.isCheckCalculationTimesFactor = false
    }
    if(Int(jawaban.denominator2) != solutions.f2.denominator){
        jawabanTemp.isDenominator2 = false
        jawabanTemp.isCheckCalculationTimesFactor = false
    }
//    if(!fractionSolutions.isDenominatorEqual){
//        solutions = fractionSolutions.steps[1] as! FractionPair
//    }else{
//        solutions = fractionSolutions.steps[0] as! FractionPair
//    }
    
//    if(Int(jawaban.numerator1) != solutions.f1.numerator || Int(jawaban.denominator1) != solutions.f1.denominator || Int(jawaban.numerator2) != solutions.f2.numerator || Int(jawaban.denominator2) != solutions.f2.denominator){
//        return false
    
     return jawabanTemp
}

func checkCalculationFraction(fractionSolutions:FractionSolutions,jawaban:Jawaban,isStepMode:Bool)-> Jawaban{
//    let solutions = fractionSolutions.steps[2] as! FinalAnswer
    let solutions:FinalAnswer
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[2] as! FinalAnswer
    }else{
        solutions = fractionSolutions.steps[1] as! FinalAnswer
    }
    
    var jawabanTemp = jawaban
    jawabanTemp.isNumerator3 = true
    jawabanTemp.isDenominator3 = true
    jawabanTemp.isNumerator = true
    jawabanTemp.isDenominator = true
    jawabanTemp.isCheckCalculation = true

    if isStepMode{
        if(Int(jawaban.numerator3) != solutions.operationResult.numerator){
            jawabanTemp.isNumerator3 = false
            jawabanTemp.isCheckCalculation = false
        }
        if(Int(jawaban.denominator3) != solutions.operationResult.denominator){
            jawabanTemp.isDenominator3 = false
            jawabanTemp.isCheckCalculation = false
        }
//        if(Int(jawaban.numerator3) != solutions.operationResult.numerator || Int(jawaban.denominator3) != solutions.operationResult.denominator){
//            return false
//        }
    }
    else{
        if(Int(jawaban.numerator) != solutions.operationResult.numerator){
            jawabanTemp.isNumerator = false
            jawabanTemp.isCheckCalculation = false
        }
        if(Int(jawaban.denominator) != solutions.operationResult.denominator){
            jawabanTemp.isDenominator = false
            jawabanTemp.isCheckCalculation = false
        }
//        if(Int(jawaban.numerator) != solutions.operationResult.numerator || Int(jawaban.denominator) != solutions.operationResult.denominator){
//            return false
//        }
    }
    return jawabanTemp
}

func checkSimplified(fractionSolutions:FractionSolutions,jawaban:Jawaban) -> Jawaban{
    
    let solutions:SimplifyProperties
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[3] as! SimplifyProperties
    }else{
        solutions = fractionSolutions.steps[2] as! SimplifyProperties
    }
    
    
    
//    solutions = fractionSolutions.steps[3] as! SimplifyProperties
    var jawabanTemp = jawaban
    jawabanTemp.isDibagi = true
    jawabanTemp.isCheckSimplified = true
    
    if(Int(jawaban.dibagi) != solutions.fpb){
        jawabanTemp.isDibagi = false
        jawabanTemp.isCheckSimplified = false
    }
    
    
    return jawabanTemp
}

func checkFinalAnswerSimplified(fractionSolutions:FractionSolutions,jawaban:Jawaban,isStepMode:Bool) -> Jawaban{
    
    let solutions:SimplifyProperties
    
    if(!fractionSolutions.isDenominatorEqual){
        solutions = fractionSolutions.steps[3] as! SimplifyProperties
    }else{
        solutions = fractionSolutions.steps[2] as! SimplifyProperties
    }
   
    var jawabanTemp = jawaban
    jawabanTemp.isNumerator4 = true
    jawabanTemp.isDenominator4 = true
    jawabanTemp.isNumerator = true
    jawabanTemp.isDenominator = true
    jawabanTemp.isCheckFinalAnswerSimplified = true
//
//    solutions = fractionSolutions.steps[3] as! SimplifyProperties
    let denominator = solutions.operationResult.denominator / solutions.fpb
    let numerator = solutions.operationResult.numerator / solutions.fpb
    
    if isStepMode{
        if Int(jawaban.numerator4) != numerator{
            jawabanTemp.isNumerator4 = false
            jawabanTemp.isCheckFinalAnswerSimplified = false
        }
        if Int(jawaban.denominator4) != denominator{
            jawabanTemp.isDenominator4 = false
            jawabanTemp.isCheckFinalAnswerSimplified = false
        }
//        if Int(jawaban.numerator4) != numerator && Int(jawaban.denominator4) != denominator{
//            return false
//        }
    }
    else{
        if Int(jawaban.numerator) != numerator{
            jawabanTemp.isNumerator = false
            jawabanTemp.isCheckFinalAnswerSimplified = false
        }
        if Int(jawaban.denominator) != denominator{
            jawabanTemp.isDenominator = false
            jawabanTemp.isCheckFinalAnswerSimplified = false
        }
//        if Int(jawaban.numerator) != numerator && Int(jawaban.denominator) != denominator{
//            return false
//        }
    }
    
    
    return jawabanTemp
}


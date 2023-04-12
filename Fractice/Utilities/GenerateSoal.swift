//
//  GenerateSoal.swift
//  Fractice
//
//  Created by Datita Devindo Bahana on 11/04/23.
//

import Foundation

enum EnumSoal:Int {
    case bilangan, cerita , gambar
}
typealias soal = (fractionPair:FractionPair,operand:Operand,questionType:EnumSoal,soalCerita:String?)


func generateSoal (setting:QuestionType) ->soal{
    
    let fractionPair = generateFractionPair()
    var operand = generateOperand()
    var arrTypeSoal:[Int] = []
    
    if(setting.isBilangan){
        arrTypeSoal.append(0)
    }
    if(setting.isCerita){
        arrTypeSoal.append(1)
    }
    if(setting.isGambar){
        arrTypeSoal.append(2)
    }
    
    let randNumberSoal = Int.random(in: 0..<arrTypeSoal.count)
    let questionType = EnumSoal(rawValue: arrTypeSoal[randNumberSoal])!
    var soalCerita:String?
    
    if(questionType == .cerita){
        let generatedCerita = generateSoalCerita(F1: fractionPair.f1, F2: fractionPair.f2)
        soalCerita = generatedCerita.cerita
        operand = generatedCerita.operand
    }
   
    
    return (fractionPair: fractionPair,operand: operand,questionType: questionType,soalCerita:soalCerita)
}

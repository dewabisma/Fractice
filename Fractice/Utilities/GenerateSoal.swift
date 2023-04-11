//
//  GenerateSoal.swift
//  Fractice
//
//  Created by Datita Devindo Bahana on 11/04/23.
//

import Foundation

enum EnumSoal:CaseIterable {
    case cerita, gambar , bilangan
}
typealias soal = (fractionPair:FractionPair,operand:Operand.RawValue,questionType:EnumSoal,soalCerita:String?)

func generateSoal () ->soal{
    
    let fractionPair = generateFractionPair()
    var operand = generateOperand()
    let questionType = EnumSoal.allCases.randomElement()!
//    let questionType = EnumSoal.gambar
    var soalCerita:String?
    
    if(questionType == .cerita){
        let generatedCerita = generateSoalCerita(F1: fractionPair.f1, F2: fractionPair.f2)
        soalCerita = generatedCerita.cerita
        operand = generatedCerita.operand.rawValue
    }
   
    
    return (fractionPair: fractionPair,operand: operand,questionType: questionType,soalCerita:soalCerita)
}

//
//  GenerateStory.swift
//  Fractice
//
//  Created by Datita Devindo Bahana on 05/04/23.
//

import Foundation
typealias soalCerita = (cerita:String, operand:Operand)
let arrayAngka:[String] = ["satu","dua","tiga","empat","lima","enam","tujuh","delapan","sembilan","sepuluh"]

let listCerita:[soalCerita] = [
    (cerita:"Andi membuat tongkat sepanjang $1 meter dan Santoso membuat tongkat sepanjang $2 meter. Total panjang tongkat mereka berdua adalah",operand:.plus),
    (cerita:"Pak Budi mempunyai gula sebanyak $1 kg. Keesokan harinya, Pak Budi membeli gula sebanyak $2 kg. Jumlah gula yang dimiliki Pak Budi saat ini adalah ",operand:.plus),
    (cerita:"Ana memiliki $1 kue ulang tahun. Kue tersebut akan dibagi kepada temannya sebanyak $2 bagian. Berapa banyak bagian kue yang tersisa untuk Ana?",operand:.minus),
    (cerita:"Ibu membeli tepung sebanyak $1 kg di pasar. Tepung tersebut akan digunakan untuk membuat kue nastar yang memerlukan $2 kg. Berapa banyak tepung yang tersisa?",operand:.minus),
    (cerita:"Dayu membeli $1 kg gula pasir. Kemudian Siti membeli $2 kg gula pasir untuk membuat kue. Berapa kg gula pasir keduanya untuk membuat kue?",operand:.plus),
    (cerita:"Ibu membeli $1 kg tepung terigu. Kemudian membeli lagi $2 kg tepung terigu untuk membuat donat. Berapa jumlah berat tepung terigu yang dimiliki ibu",operand:.plus),
    (cerita:"Pak Anton memiliki sebidang tanah seluas $1 hektar, kemudian ia membeli lagi $2 hektar. Berapa luas tanah yang dimiliki Pak Anton saat ini?",operand:.plus),
    (cerita:"Nenek membeli $1 kg salak. Nenek memberikan kepada ibu $2 kg. Sisa salak nenek adalah",operand:.minus),
    (cerita:"Luis dan Jessica bersama-sama memakan $1 pizza, Luis memakan $2 bagian, Berapakah pecahan piza yang Jessica makan?",operand:.minus),
    (cerita:"Ibu memiliki sisa semangka $1 bagian, ayah memakan $2 bagian. berapa bagian bagian semangka yang tersisa?",operand:.minus)
    
]


func generateNamaPecahan (F:Fraction)-> String{
    let numeratorF:Int = F.numerator
    let denominatorF:Int = F.denominator
    
    if(numeratorF == 1){
        if(denominatorF == 2){
            return "setengah"
        }else{
            return "seper"+arrayAngka[denominatorF-1]
        }
    }
    
    return arrayAngka[numeratorF - 1] + " per " + arrayAngka[denominatorF-1]
}

func generateSoalCerita (F1:Fraction,F2:Fraction) -> soalCerita{
    
    let randNum = Int.random(in: 0...listCerita.count-1)
    
    var cerita = listCerita[randNum].cerita
    let operand =  listCerita[randNum].operand
    
    let pecahan1 = generateNamaPecahan(F: F1)
    let pecahan2 = generateNamaPecahan(F: F2)
    cerita = cerita.replacingOccurrences(of: "$1", with: "__\(pecahan1)__")
    cerita = cerita.replacingOccurrences(of: "$2", with: "__\(pecahan2)__")
    
    return (cerita,operand)
}



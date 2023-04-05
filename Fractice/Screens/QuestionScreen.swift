//
//  QuestionScreen.swift
//  Fractice
//
//  Created by Trolley on 04/04/23.
//

import SwiftUI

struct AnswerField: View {
    @State var inputJawaban: String
    var body: some View {
        
        TextField(
                    "",
                    text: $inputJawaban
                )
        
        .frame(width: 48, height: 48)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
        ) //.padding(.vertical, 8)
        
    }
}


struct ButtonBelow: View {
    
    var body: some View {
            HStack {
                
                Button {} label: {
                    Text ("TAHAPAN")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .tracking(5)
                        .foregroundColor(Color ("OrangeText"))
                    
                        
                }
                .frame(maxWidth: 152, maxHeight: 48)
                .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color("OrangeDark"), lineWidth: 2)
                        )
                .background(.white)
                .cornerRadius(30)
                .padding(.bottom, 32)
                .padding(.trailing, 8)
                
                Button {} label: {
                    Text ("JAWAB")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .tracking(5)
                        .foregroundColor(Color .white)
                }
                .frame(maxWidth: 152, maxHeight: 48)
                .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                .cornerRadius(30)
                .padding(.bottom, 32)
                .padding(.leading, 8)
                
            }
            .frame(maxWidth:.infinity, maxHeight: 143)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color ("GrayBlur"), radius: 5, x:0, y:-3)
    }
}

struct QuestionScreen: View {
    @State private var inputJawaban1: String = ""
    @State private var inputJawaban2: String = ""
    var isClicked = false
    
    var body: some View {
                
        VStack {
            VStack {
                HStack {
                    Button {} label: {
                        Image(systemName: "x.square.fill")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Text ("Soal 1")
                        .foregroundColor(Color("NavyText"))
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 27, height: 27)
                            .foregroundColor(.gray)
                    }
                }.padding(.horizontal, 32)
                
                VStack {
                    Text("Pak Budi, seorang pembuat sirup. Ia memiliki gula 614kg gula. Kemudian membeli lagi 412kg. Selanjutnya, gula tersebut dibuat sirup yang harganya 50 ribu. Banyaknya botol yang harus disediakan Pak Budi adalah …")
        
                        .fontWeight(.semibold)
                        .lineSpacing(16)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.all, 24)
                }
                .frame(maxWidth:.infinity, maxHeight: 280)
                .background(Color ("PurpleLight"))
                .cornerRadius(20)
                .padding(.vertical, 32)
                .padding(.horizontal, 32)
                .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
                
                
                HStack {
                    Text ("Jawaban")
                        .foregroundColor(Color("OrangeText"))
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    Spacer()
                } .padding(.leading, 32)
                    .padding(.bottom, 16)
                
                if isClicked {
                    
                    HStack {
                        
                    }
                    
                    Text ("Jawaban")
                        .foregroundColor(Color("OrangeText"))
                }
                
                AnswerField(inputJawaban: inputJawaban1)
                
                Image (systemName: "minus")
                    .resizable()
                    .frame(width: 48, height: 2)
                    .padding(.vertical, 12)
                
                AnswerField(inputJawaban: inputJawaban2)
                
                Spacer()
                
                
            }
            
            ButtonBelow()

        }
        .ignoresSafeArea(.all)
        .frame(maxHeight: .infinity)
        .background(.white)
        .padding(.top, 24)
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuestionScreen()
    }
}


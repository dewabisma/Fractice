//
//  QuestionScreen.swift
//  Fractice
//
//  Created by Trolley on 04/04/23.
//

import SwiftUI

struct QuestionScreen: View {
    @State private var inputJawaban1: String = ""
    @State private var inputJawaban2: String = ""

    var body: some View {
                
        VStack {
            VStack {
                HStack {
    //                Spacer ()
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
                    
    //                Spacer()
                }.padding(.horizontal, 32)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color ("PurpleLight"))
                                    .frame(maxWidth: 326, maxHeight: 280)
                                    .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)

                    
                    Text("Pak Budi, seorang pembuat sirup. Ia memiliki gula 614kg gula. Kemudian membeli lagi 412kg. Selanjutnya, gula tersebut dibuat sirup yang harganya 50 ribu. Banyaknya botol yang harus disediakan Pak Budi adalah …")
                        
                        
                        .frame(maxWidth: 290, maxHeight: 210)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        //.multilineTextAlignment(.justified)
                        //.justifiedTextAlignment
                    
                        //.lineLimit(3)
                }.padding(.vertical, 30)
                
                
                HStack {
                    Text ("Jawaban")
                        .foregroundColor(Color("OrangeText"))
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.leading)
                    Spacer()
                } .padding(.leading)
                
                TextField(
                            "",
                            text: $inputJawaban1
                        )
                
                .frame(width: 40, height: 40)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                ) .padding(.top, 30)
                
                /*RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color .gray,lineWidth: 2)
                    .frame(width: 40, height: 40)*/
                
                Image (systemName: "minus")
                    .resizable()
                    .frame(width: 40, height: 2)
                    .padding(.vertical, 5)
                
                
                /*RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color .gray,lineWidth: 2)
                    .frame(width: 40, height: 40)*/
                
                TextField(
                            "",
                            text: $inputJawaban2
                        )
                
                .frame(width: 40, height: 40)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                
                Spacer()
                
                
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.white)
                    .frame(maxWidth: 390, maxHeight: 143)
                    .shadow(color: Color ("GrayBlur"), radius: 5, x:0, y:-3)
                    
                
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
                    
                } .padding(.bottom, 20)
                
            }
            
            
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

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

//struct AnswerFieldSteps: View {
//    @State var inputJawabanSteps: String
//    var body: some View {
//
//        TextField(
//                    "",
//                    text: $inputJawabanSteps
//                )
//
//        .frame(width: 32, height: 32)
//        .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray, lineWidth: 2)
//        ) //.padding(.vertical, 8)
//    }
//}

struct Steps: View {
    var title:String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(Color("NavyText"))
                .fontWeight(.semibold)
                .padding(.vertical, 16)
                .padding(.leading, 40)
            Spacer()
        }
        .frame(maxWidth:.infinity)
        .background(Color("PurpleSteps"))
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .frame(maxWidth: 24)
                .foregroundColor(Color ("PurpleLight")), alignment: .leading
                       )
        .cornerRadius(16)
//        .padding(.vertical)
    }
}

struct QuestionScreen: View {
    @State private var inputJawaban1: String = ""
    @State private var inputJawaban2: String = ""
//    @State private var inputAns1: String = ""
//    @State private var inputAns2: String = ""
//    @State private var inputAns3: String = ""
    @State var isClicked = false
    @State private var showAlert = false
    
    var body: some View {
            VStack {
                HStack {
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "x.square.fill")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.red)
                    } .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Kamu yakin nih mau keluar?"),
                            message: Text("\n Jika kamu keluar sekarang, kamu akan mengulang dari awal \n"),
                            primaryButton: .default(
                                            Text("Yup!")
                                        ),
                            secondaryButton: .destructive(
                                Text("Batal"))
                        )
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
                        .lineSpacing(12)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.all, 24)
//                    Spacer()
                }
                .frame(maxWidth:.infinity, maxHeight: 280)
                .background(Color ("PurpleLight"))
                .cornerRadius(20)
                .padding(.all, 32)
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
                    Steps(title: "Step 1: Equalize Denominator")
                        .padding(.horizontal, 32)
                    
                    HStack {
                        FractionNotation (numerator: 1, denominator: 2)
                        
//                        AnswerFieldSteps(inputJawabanSteps: inputAns1)
                        
                        
                    }
                    
                } else {
                    AnswerField(inputJawaban: inputJawaban1)
                    
                    Image (systemName: "minus")
                        .resizable()
                        .frame(width: 48, height: 2)
                        .padding(.vertical, 12)
                    
                    AnswerField(inputJawaban: inputJawaban2)
                    
                }
                
                Spacer()
                HStack {
                        Spacer()
                        Button {
                            isClicked = !isClicked
                        } label: {
                            if isClicked {
                                Text ("LANGSUNG")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                    .tracking(3)
                                    .foregroundColor(Color ("OrangeText"))
                            } else {
                                Text ("TAHAPAN")
                                    .fontWeight(.bold)
                                    .font(.system(size: 20))
                                    .tracking(5)
                                    .foregroundColor(Color ("OrangeText"))
                            }
                        }
                        .frame(maxWidth: 168, maxHeight: 48)
                        .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("OrangeDark"), lineWidth: 2)
                                )
                        .background(.white)
                        .cornerRadius(30)
                        .padding(.bottom, 32)
                    
                        Spacer()
                    
                        Button {
                        } label: {
                            Text ("JAWAB")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        .frame(maxWidth: 168, maxHeight: 48)
                        .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .padding(.bottom, 32)
                        Spacer()
                    }
                    .frame(maxWidth:.infinity, maxHeight: 143)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(color: Color ("GrayBlur"), radius: 5, x:0, y:-3)
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


//
//  QuestionScreen.swift
//  Fractice
//
//  Created by Trolley on 04/04/23.
//

import SwiftUI

struct Jawaban {
    var numerator:String = ""
    var numerator1: String = ""
    var numerator2:String = ""
    var denominator:String = ""
    var denominator1: String = ""
    var denominator2:String = ""
    var dikali1: String = ""
    var dikali2: String = ""
    var dibagi: String = ""
}

struct QuestionType{
    var isBilangan:Bool = false
    var isCerita:Bool = false
    var isGambar:Bool = false
}

struct AnswerField: View {
    @Binding var inputJawaban: String
    var body: some View {
        
        TextField(
            "",
            text: $inputJawaban
        )
        .multilineTextAlignment(.center)
        .frame(width: 40, height: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .keyboardType(.numberPad)
    }
}

struct AnswerField1: View {
    @Binding var inputJawaban: String
    var color:Color = Color.gray
    
    var body: some View {
        
        TextField(
            "",
            text: $inputJawaban
        )
        .multilineTextAlignment(.center)
        .frame(width: 48, height: 48)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color, lineWidth: 2)
        )
        .keyboardType(.numberPad)
    }
}

struct Steps: View {
    var title:String
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                    .padding(.vertical, 8)
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
            .cornerRadius(9)
        } .padding(.bottom, 12)
    }
}

struct EqualizeDenominator: View {
    @Binding var pengali1:String
    @Binding var pengali2:String
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Text("1")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Image(systemName: "multiply")
                    AnswerField(inputJawaban: $pengali1)
                }
                
                Image (systemName: "minus")
                    .resizable()
                    .frame(width: 100, height: 2)
                    .padding(.vertical, 12)
                
                HStack(spacing: 12) {
                    Text("3")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Image(systemName: "multiply")
                    AnswerField(inputJawaban: $pengali1)
                }
            }
            
            Image(systemName: "plus")
                .padding(.horizontal)
            
            VStack{
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        Text("1")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        AnswerField(inputJawaban: $pengali2)
                    }
                    
                    Image (systemName: "minus")
                        .resizable()
                        .frame(width: 100, height: 2)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 12) {
                        Text("2")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        AnswerField(inputJawaban: $pengali2)
                    }
                }
            }
        }
    }
}

struct DoCalculation: View {
    @Binding var pembilang1:String
    @Binding var pembilang2:String
    @Binding var penyebut1:String
    @Binding var penyebut2:String
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $pembilang1)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 50, height: 2)
                    .padding(.vertical, 12)
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $penyebut1)
                }
            }
            
            Image(systemName: "plus")
                .padding(.horizontal)
            
            VStack{
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        AnswerField(inputJawaban: $pembilang2)
                    }
                    
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 50, height: 2)
                        .padding(.vertical, 12)
                    HStack(spacing: 12) {
                        AnswerField(inputJawaban: $penyebut2)
                    }
                }
            }
        }
    }
}

struct SimplifyFraction: View {
    @Binding var pembilang:String
    @Binding var penyebut:String
    @Binding var pembagi:String
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $pembilang)
                    Image(systemName: "divide")
                    AnswerField(inputJawaban: $pembagi)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 130, height: 2)
                    .padding(.vertical, 12)
                
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $penyebut)
                    Image(systemName: "divide")
                    AnswerField(inputJawaban: $pembagi)
                }
            }
        }
    }
}

struct QuestionScreen: View {
    @State private var jawaban = Jawaban()
    @State private var isStepMode = true
    @State private var isCheck = false
    @State private var isCorrect = false
    @State private var showAlert = false
    @State private var stepOneDone:Bool = false
    @State private var stepTwoDone = false
    @State private var stepThreeDone = false
    @State private var isPresented = false
    @State private var setting:QuestionType = QuestionType(isBilangan: true,isCerita: false,isGambar: false)
    init(){
        print("masukcuk")
    }
    var body: some View {
        VStack {
            HStack {
                Button {
                    showAlert = true
                } label: {
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .frame(width: 27, height: 27)
                        .foregroundColor(.red)
                } .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Kamu yakin nih mau keluar?"),
                        message: Text("\n Jika kamu keluar sekarang, kamu akan mengulang dari awal \n"),
                        primaryButton: .default(
                            Text("Keluar")
                        ),
                        secondaryButton: .destructive(
                            Text("Batal"))
                    )
                }
                
                Spacer()
                
                Text ("Soal 1")
                    .foregroundColor(Color("NavyText"))
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                
                Spacer()
                
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 27, height: 27)
                        .foregroundColor(.gray)
                }.fullScreenCover(isPresented: $isPresented){
                    SettingScreen(isPresented: $isPresented, setting:$setting)
                }
            }.padding(.horizontal, 32)
            
            VStack {
                Text("Pak Budi, seorang pembuat sirup. Ia memiliki gula 614kg gula. Kemudian membeli lagi 412kg. Selanjutnya, gula tersebut dibuat sirup yang harganya 50 ribu. Banyaknya botol yang harus disediakan Pak Budi adalah …")
                
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .lineSpacing(8)
                    .foregroundColor(.white)
                    .padding(.all, 24)
            }
            .frame(maxWidth:.infinity)
            .frame(height:270)
            .background(Color ("PurpleLight"))
            .cornerRadius(20)
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
            
            
            HStack {
                Text ("Jawaban")
                    .foregroundColor(Color("OrangeText"))
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                Spacer()
            } .padding(.leading, 32)
                .padding(.bottom, 20)
            
            if isStepMode {
                ScrollView {
                    Group {
                        Steps(title: "Step 1: Samakan penyebut")
                            .padding(.horizontal, 32)
                        
                        Spacer()
                        
                        EqualizeDenominator(pengali1: $jawaban.dikali1, pengali2: $jawaban.dikali2)
                        
                        Spacer()
                    }
                    
                    if stepOneDone {
                        Group {
                            Steps(title: "Step 2: Hitunglah operasi aritmatika pecahan")
                                .padding(.horizontal, 32)
                            
                            Spacer()
                            
                            DoCalculation(pembilang1: $jawaban.numerator1, pembilang2: $jawaban.numerator2, penyebut1: $jawaban.denominator1, penyebut2: $jawaban.denominator2)
                            
                            Spacer()
                        }
                        
                    }
                    
                    if stepTwoDone {
                        Group {
                            Steps(title: "Step 3: Sederhanakan pecahan")
                                .padding(.horizontal, 32)
                            
                            Spacer()
                            
                            SimplifyFraction(pembilang: $jawaban.numerator, penyebut: $jawaban.denominator, pembagi: $jawaban.dibagi)
                            
                            Spacer()
                        }
                    }
                    
                    if stepThreeDone {
                        Group {
                            Steps(title: "Step 4: Masukkan Jawaban")
                                .padding(.horizontal, 32)
                            
                            Spacer ()
                            
                            AnswerField1(inputJawaban: $jawaban.numerator, color: isCheck ? ((isCorrect) ? Color.green: Color.red) : Color.black)
                                .foregroundColor(isCheck ? Color.green : Color.black)
                            
                            Image (systemName: "minus")
                                .resizable()
                                .frame(width: 48, height: 2)
                                .padding(.vertical, 12)
                            
                            AnswerField1(inputJawaban: $jawaban.denominator, color: isCheck ? ((isCorrect) ? Color.green: Color.red) : Color.black)
                                .foregroundColor(isCheck ? Color.green : Color.black)
                            
                            Spacer()
                        }
                    }
                }
            } else {
                Spacer ()
                AnswerField1(inputJawaban: $jawaban.numerator)
                
                Image (systemName: "minus")
                    .resizable()
                    .frame(width: 48, height: 2)
                    .padding(.vertical, 12)
                
                AnswerField1(inputJawaban: $jawaban.denominator)
                Spacer()
            }
            
            Spacer()
            HStack {
                Spacer()
                Button {
                    isStepMode = !isStepMode
                } label: {
                    if isStepMode {
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
                    if !isStepMode {
                        isCheck = !isCheck
                    }
                    
                    // Check step dari yg paling akhir ke awal
                    if stepThreeDone {
                        isCheck = !isCheck
                    }
                    
                    if stepTwoDone && !stepThreeDone {
                        stepThreeDone = !stepThreeDone
                    }
                    
                    if stepOneDone && !stepTwoDone {
                        stepTwoDone = !stepTwoDone
                    }
                    
                    if !stepOneDone {
                        stepOneDone = !stepOneDone
                    }
                } label: {
                    if isStepMode && !stepThreeDone {
                        Text ("CEK")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .tracking(5)
                            .foregroundColor(Color .white)
                    } else {
                        Text ("JAWAB")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .tracking(5)
                            .foregroundColor(Color .white)
                    }
                }
                .frame(maxWidth: 168, maxHeight: 48)
                .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                .cornerRadius(30)
                .padding(.bottom, 32)
                
                Spacer()
                
            }
            .frame(maxWidth:.infinity, maxHeight: 130)
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


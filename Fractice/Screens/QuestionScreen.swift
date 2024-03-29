//
//  QuestionScreen.swift
//  Fractice
//
//  Created by Trolley on 04/04/23.
//

import SwiftUI
import Combine


// numerator,denumorator -> jawaban utama
// numerator,denumorator 1..4 -> jawabn step by step
// dikali -> jawaban pengali untuk penyamaan penyebut
// dibagi -> jawaban pembagi untuk penyederhanaan pecahan
struct Jawaban {
    var numerator:String = ""
    var isNumerator:Bool = true
    var numerator1: String = ""
    var isNumerator1:Bool = true
    var numerator2:String = ""
    var isNumerator2:Bool = true
    var numerator3:String = ""
    var isNumerator3:Bool = true
    var numerator4:String = ""
    var isNumerator4:Bool = true
    var denominator:String = ""
    var isDenominator:Bool = true
    var denominator1: String = ""
    var isDenominator1:Bool = true
    var denominator2:String = ""
    var isDenominator2:Bool = true
    var denominator3:String = ""
    var isDenominator3:Bool = true
    var denominator4:String = ""
    var isDenominator4:Bool = true
    var dikali1: String = ""
    var isDikali1:Bool = true
    var dikali2: String = ""
    var isDikali2:Bool = true
    var dibagi: String = ""
    var isDibagi:Bool = true
    var isCheckEqualize:Bool = true
    var isCheckCalculationTimesFactor:Bool = true
    var isCheckCalculation:Bool = true
    var isCheckSimplified:Bool = true
    var isCheckFinalAnswerSimplified:Bool = true
}

struct QuestionType{
    var isBilangan:Bool = false
    var isCerita:Bool = false
    var isGambar:Bool = false
}

struct soalPecahanView: View{
    @Binding var fraction:FractionPair
    @Binding var operand:String
    var body: some View{
        HStack {
            Spacer()
            VStack{
                Text("\(fraction.f1.numerator)")
                    .font(.system(size: 36,weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                Image(systemName: "minus")
                    .resizable()
                    .frame(width:40, height:4)
                    .foregroundColor(.white)
                Text("\(fraction.f1.denominator)")
                    .font(.system(size: 36,weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            Spacer()
                .frame(width: 30)
            if(operand == "plus"){
                Image(systemName: operand)
                    .resizable()
                    .frame(width:30, height:30)
                    .foregroundColor(.white)
            }
            else{
                Image(systemName: operand)
                    .resizable()
                    .frame(width:30, height:2)
                    .foregroundColor(.white)
            }
            Spacer()
                .frame(width: 30)
            
            VStack{
                Text("\(fraction.f2.numerator)")
                    .font(.system(size: 36,weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                Image(systemName: "minus")
                    .resizable()
                    .frame(width:40, height:4)
                    .foregroundColor(.white)
                Text("\(fraction.f2.denominator)")
                    .font(.system(size: 36,weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct soalGambarView: View{
    @Binding var fraction:FractionPair
    @Binding var operand:String
    var body: some View{
        HStack {
            Spacer()
            FractionShape(numerator: fraction.f1.numerator, denominator: fraction.f1.denominator)
            
            Spacer()
            
            if(operand == "plus"){
                Image(systemName: operand)
                    .resizable()
                    .frame(width:30, height:30)
                    .foregroundColor(.white)
            }
            else{
                Image(systemName: operand)
                    .resizable()
                    .frame(width:30, height:2)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            FractionShape(numerator: fraction.f2.numerator, denominator: fraction.f2.denominator)
            Spacer()
        }
    }
}
struct AnswerField: View {
    @Binding var inputJawaban: String
    var isDisabled:Bool = false
    var isCorrect = true
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
        .background(RoundedRectangle(cornerRadius: 10).fill(isCorrect == true ? Color.white : Color.red))
        //        .foregroundColor(isCorrect == true ? Color.black : Color.red)
        .keyboardType(.numberPad)
        .disabled(isDisabled)
    }
}

struct AnswerField1: View {
    @Binding var inputJawaban: String
    var isCorrect = true
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
        .background(RoundedRectangle(cornerRadius: 10).fill(isCorrect == true ? Color.white : Color.red))
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
    var fraction:FractionPair
    @Binding var pengali1:String
    @Binding var pengali2:String
    var operand:String
    var isDisbaled = false
    var jawaban:Jawaban
    
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Text("\(fraction.f1.numerator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Image(systemName: "multiply")
                    AnswerField(inputJawaban: $pengali1, isDisabled: isDisbaled,isCorrect:jawaban.isDikali1)
                }
                
                Image (systemName: "minus")
                    .resizable()
                    .frame(width: 100, height: 2)
                    .padding(.vertical, 12)
                
                HStack(spacing: 12) {
                    Text("\(fraction.f1.denominator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    Image(systemName: "multiply")
                    AnswerField(inputJawaban: $pengali1,isDisabled: isDisbaled,isCorrect:jawaban.isDikali1)
                }
            }
            
            Image(systemName: operand)
                .padding(.horizontal)
            
            VStack{
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        Text("\(fraction.f2.numerator)")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        AnswerField(inputJawaban: $pengali2,isDisabled: isDisbaled,isCorrect:jawaban.isDikali2)
                    }
                    
                    Image (systemName: "minus")
                        .resizable()
                        .frame(width: 100, height: 2)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 12) {
                        Text("\(fraction.f2.denominator)")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        Image(systemName: "multiply")
                        AnswerField(inputJawaban: $pengali2,isDisabled: isDisbaled,isCorrect:jawaban.isDikali2)
                    }
                }
            }
        }
    }
}

struct DoCalculationFractionTimesFactor: View {
    var pembilang1:String
    var penyebut1:String
    var pembilang2:String
    var penyebut2:String
    @Binding var pembilang3:String
    @Binding var penyebut3:String
    var operand:String
    var isDisabled:Bool = false
    var jawaban:Jawaban
    
    
    //    var hasilTimesFactorFraction:FractionPair
    
    
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                Text(pembilang1)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                Text(penyebut1)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
            }
            
            Image(systemName: operand)
                .padding(.horizontal)
            
            VStack(spacing: 4) {
                Text(pembilang2)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                Text(penyebut2)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("NavyText"))
            }
            
            Image(systemName: "equal")
                .padding(.horizontal)
            
            VStack(spacing: 4) {
                AnswerField(inputJawaban: $pembilang3,isDisabled:isDisabled,isCorrect: jawaban.isNumerator3)
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 36, height: 2)
                    .padding(.vertical, 4)
                
                AnswerField(inputJawaban: $penyebut3,isDisabled:isDisabled,isCorrect: jawaban.isDenominator3)
            }
        }
    }
}

struct DoCalculation: View {
    @Binding var pembilang1:String
    @Binding var pembilang2:String
    @Binding var penyebut1:String
    @Binding var penyebut2:String
    var  operand:String
    var isDisabled:Bool = false
    var jawaban:Jawaban
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $pembilang1,isDisabled: isDisabled,isCorrect: jawaban.isNumerator1)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 50, height: 2)
                    .padding(.vertical, 12)
                HStack(spacing: 12) {
                    AnswerField(inputJawaban: $penyebut1,isDisabled: isDisabled,isCorrect: jawaban.isDenominator1)
                }
            }
            
            Image(systemName: operand)
                .padding(.horizontal)
            
            VStack{
                VStack(spacing: 4) {
                    HStack(spacing: 12) {
                        AnswerField(inputJawaban: $pembilang2,isDisabled: isDisabled,isCorrect: jawaban.isNumerator2)
                    }
                    
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 50, height: 2)
                        .padding(.vertical, 12)
                    HStack(spacing: 12) {
                        AnswerField(inputJawaban: $penyebut2,isDisabled: isDisabled,isCorrect: jawaban.isDenominator2)
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
    var isDisabled : Bool = false
    var jawaban : Jawaban
    
    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Text(pembilang)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "divide")
                    AnswerField(inputJawaban: $pembagi,isDisabled: isDisabled,isCorrect: jawaban.isDibagi)
                }
                
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 130, height: 2)
                    .padding(.vertical, 12)
                
                HStack(spacing: 12) {
                    Text(penyebut)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "divide")
                    AnswerField(inputJawaban: $pembagi,isDisabled: isDisabled,isCorrect: jawaban.isDibagi)
                }
            }
        }
    }
}

struct QuestionScreen: View {
    @State private var jawaban = Jawaban()
    @State private var isStepMode = false
    @State private var isCheck = false
    @State private var isCorrect = false
    @State private var showAlert = false
    @State private var showWrongAlert = false
    @State private var stepOneDone:Bool = false
    @State private var stepTwoDone = false
    @State private var stepThreeDone = false
    @State private var stepSimplify = false
    @State private var isDisabledStep1 = false
    @State private var isDisabledStep2 = false
    @State private var isDisabledStep3 = false
    @State private var isDisabledStepSimplify = false
    @State private var isPresented = true
    @State private var setting:QuestionType
    @State private var Soal:soal
    @State private var fractionSolutions:FractionSolutions
    @State var operand:String
    @State var isGoToReviewPage:Bool = false
    @State private var keyboardHeight: CGFloat = 0
    
    @FocusState var isFocused
    
    init() {
        let settingku = QuestionType(isBilangan: true,isCerita: false,isGambar: true)
        let soalku = generateSoal(setting: settingku)
        let solusi = generateSolutionSteps(f1: soalku.fractionPair.f1, f2: soalku.fractionPair.f2, operand: soalku.operand)
        setting = settingku
        Soal = soalku
        fractionSolutions = solusi
        operand = soalku.operand.rawValue
        print(fractionSolutions.canBeSimplified)
        
        
    }
    
    var body: some View {
        if !isGoToReviewPage {
            VStack {
                //            NavigationLink(destination: ReviewScreen(), isActive: $GoToReviewPage){
                //                           EmptyView()
                //                       }
               
                VStack {
                    HStack {
                        //                Button {
                        //                    showAlert = true
                        //                } label: {
                        //                    Image(systemName: "x.square.fill")
                        //                        .resizable()
                        //                        .frame(width: 27, height: 27)
                        //                        .foregroundColor(.red)
                        //                } .alert(isPresented: $showAlert) {
                        //                    Alert(
                        //                        title: Text("Kamu yakin nih mau keluar?"),
                        //                        message: Text("\n Jika kamu keluar sekarang, kamu akan mengulang dari awal \n"),
                        //                        primaryButton: .default(
                        //                            Text("Keluar")
                        //                        ),
                        //                        secondaryButton: .destructive(
                        //                            Text("Batal"))
                        //                    )
                        //                }
                        Button {
                            isPresented.toggle()
                            isStepMode = false
                            isCheck = false
                            isCorrect = false
                            showAlert = false
                            stepOneDone = false
                            stepTwoDone = false
                            stepThreeDone = false
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 27, height: 27)
                                .foregroundColor(Color("NavyText"))
                        }.sheet(isPresented: $isPresented){
                            SettingScreen(isPresented: $isPresented, setting:$setting)
                        }
                        Spacer()
    //                    Spacer().frame(width:25)
                        
                        Text ("Soal")
                            .foregroundColor(Color("NavyText"))
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                        
                        Spacer()
                    
                        Button{
                           
                            showAlert.toggle()
                        }label:{
                           
                            Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("NavyText"))
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Apakah kamu ingin menyerah?"),
                                
                                primaryButton: .default(
                                    Text("Ya")
                                    ,action:{
                                        isGoToReviewPage.toggle()
                                    }
                                ),
                                secondaryButton: .destructive(
                                    Text("Tidak"))
                            )
                        }
                    }.padding(.horizontal, 32)
                    
                    VStack {
                        if(Soal.questionType == .cerita){
                            Text(.init(Soal.soalCerita!))
                                .font(.system(size: 18,weight: .regular, design: .rounded))
                                .lineSpacing(8)
                                .foregroundColor(.white)
                                .padding(.all, 24)
                            
                        }
                        else if(Soal.questionType == .bilangan){
                            soalPecahanView(fraction: $Soal.fractionPair,operand:$operand)
                        }
                        else if(Soal.questionType == .gambar){
                            soalGambarView(fraction: $Soal.fractionPair,operand:$operand)
                        }
                        
                    }
                    .frame(maxWidth:.infinity)
                    .frame(height:270)
                    .background(Color ("PurpleLight"))
                    .cornerRadius(20)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 24)
                    .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
                    .onChange(of: isPresented || isGoToReviewPage) { newValue in
                        
                        if !newValue {
                            
                            let settingGenerate = QuestionType(isBilangan: setting.isBilangan,isCerita: setting.isCerita,isGambar: setting.isGambar)
                            let soalGenerate = generateSoal(setting: settingGenerate)
                            let solusiGenerate = generateSolutionSteps(f1: soalGenerate.fractionPair.f1, f2: soalGenerate.fractionPair.f2, operand: soalGenerate.operand)
                            let operasi = soalGenerate.operand.rawValue
                            
                            
                            setting = settingGenerate
                            Soal = soalGenerate
                            fractionSolutions = solusiGenerate
                            operand = operasi
                            jawaban = Jawaban()
                            stepTwoDone = false
                            stepOneDone = false
                            stepThreeDone = false
                            stepSimplify = false
                            isDisabledStep1 = false
                            isDisabledStep2 = false
                            isDisabledStep3 = false
                            isDisabledStepSimplify = false
                            isStepMode = false
                            print(fractionSolutions.canBeSimplified)
                            if(solusiGenerate.isDenominatorEqual){
                                stepOneDone.toggle()
                                stepTwoDone.toggle()
                                
                            }
                        }
                        
                    }
                    
                    
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
                            if !fractionSolutions.isDenominatorEqual{
                                // stepOneDone -> samakan penyebut
                                // stepTwoDone -> hasil kali dari samakan penyebut
                                // stepThreeDone -> hasil jumlah/kurang pecahan dari samakan penyebut
                                //stepFourDone -> kalau bisa di sederhanakan
                                Group {
                                    Steps(title: "Step 1: Samakan penyebut")
                                        .padding(.horizontal, 32)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        EqualizeDenominator(fraction: Soal.fractionPair, pengali1: $jawaban.dikali1, pengali2: $jawaban.dikali2,operand: operand,isDisbaled: isDisabledStep1,jawaban:jawaban)
                                            .focused($isFocused)
                                    }
                                    
                                    Spacer()
                                        .frame(height: 25)
                                    
                                }
                                if stepOneDone {
                                    Group {
                                        // jangan lupa ganti nama ya
                                        //sama disable kalau dia kelar
                                        Steps(title: "Step 2: Tuliskan hasil persamaan penyebut")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer()
                                        
                                        DoCalculation(pembilang1: $jawaban.numerator1, pembilang2: $jawaban.numerator2, penyebut1: $jawaban.denominator1, penyebut2: $jawaban.denominator2,operand:operand,isDisabled:isDisabledStep2,jawaban:jawaban)
                                            .focused($isFocused)
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                    
                                }
                                
                                if stepTwoDone {
                                    Group {
                                        Steps(title: "Step 3: Hitunglah operasi aritmatika pecahan")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer()
                                        
                                        DoCalculationFractionTimesFactor(pembilang1: jawaban.numerator1, penyebut1: jawaban.denominator1, pembilang2: jawaban.numerator2, penyebut2: jawaban.denominator2,pembilang3: $jawaban.numerator3,penyebut3: $jawaban.denominator3,operand: operand,isDisabled:isDisabledStep3,jawaban:jawaban)
                                            .focused($isFocused)
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                }
                                // nanti disini dicek kalau dia bisa disederhanakan
                                
                                if stepThreeDone && fractionSolutions.canBeSimplified {
                                    Group {
                                        Steps(title: "Step 4: Cari hasil pembagi untuk sederhanakan  pecahan")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer ()
                                        SimplifyFraction(pembilang: $jawaban.numerator3, penyebut: $jawaban.denominator3, pembagi: $jawaban.dibagi,isDisabled:isDisabledStepSimplify,jawaban:jawaban)
                                            .focused($isFocused)
                                        
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                }
                                if stepSimplify && fractionSolutions.canBeSimplified{
                                    Group {
                                        Steps(title: "Step 5: Hitung Hasil sederhana")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer ()
                                        AnswerField1(inputJawaban: $jawaban.numerator4)
                                            .focused($isFocused)
                                        
                                        Image (systemName: "minus")
                                            .resizable()
                                            .frame(width: 48, height: 2)
                                            .padding(.vertical, 12)
                                        
                                        AnswerField1(inputJawaban: $jawaban.denominator4)
                                            .focused($isFocused)
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                }
                                
                            }
                            else{
                                // kalau dia penyebutnya sama tidak perlu step satu dan dua langsung done aja
                                // insert nilai numerator
                                
                                Group {
                                    Steps(title: "Step 1: hitung pecahan")
                                        .padding(.horizontal, 32)
                                    
                                    Spacer()
                                    
                                    DoCalculationFractionTimesFactor(pembilang1: String(Soal.fractionPair.f1.numerator), penyebut1: String(Soal.fractionPair.f1.denominator), pembilang2: String(Soal.fractionPair.f2.numerator), penyebut2: String(Soal.fractionPair.f2.denominator),pembilang3: $jawaban.numerator3,penyebut3: $jawaban.denominator3,operand: operand,isDisabled:isDisabledStep3,jawaban: jawaban)
                                        .focused($isFocused)
                                    Spacer()
                                        .frame(height: 25)
                                }
                                
                                if stepThreeDone && fractionSolutions.canBeSimplified {
                                    Group {
                                        Steps(title: "Step 2: Cari hasil pembagi untuk sederhanakan  pecahan")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer ()
                                        SimplifyFraction(pembilang: $jawaban.numerator3, penyebut: $jawaban.denominator3, pembagi: $jawaban.dibagi,isDisabled: isDisabledStepSimplify,jawaban:jawaban)
                                            .focused($isFocused)
                                        
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                }
                                if stepSimplify && fractionSolutions.canBeSimplified{
                                    Group {
                                        Steps(title: "Step 3: Hitung Hasil sederhana")
                                            .padding(.horizontal, 32)
                                        
                                        Spacer ()
                                        AnswerField1(inputJawaban: $jawaban.numerator4)
                                            .focused($isFocused)
                                            
                                        
                                        Image(systemName: "minus")
                                            .resizable()
                                            .frame(width: 48, height: 2)
                                            .padding(.vertical, 12)
                                        
                                        AnswerField1(inputJawaban: $jawaban.denominator4)
                                            .focused($isFocused)
                                            
                                        Spacer()
                                            .frame(height: 25)
                                    }
                                }
                            }
                            
                            
                        }
                    } else {
                        
                        Spacer ()
                        AnswerField1(inputJawaban: $jawaban.numerator,isCorrect:jawaban.isNumerator)
                            .focused($isFocused)
                            
                        
                        Image (systemName: "minus")
                            .resizable()
                            .frame(width: 48, height: 2)
                            .padding(.vertical, 12)
                        
                        AnswerField1(inputJawaban: $jawaban.denominator,isCorrect: jawaban.isDenominator)
                            .focused($isFocused)
                            
                        Spacer()
                    }
                    
                    HStack {}.padding(.bottom, keyboardHeight)
                }
                
                .onReceive(Publishers.keyboardHeight) {
                    self.keyboardHeight = $0 - 150.0
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
                        if isStepMode {
                            isCheck = !isCheck
                            if !fractionSolutions.isDenominatorEqual{
                                if !stepOneDone {
                                    jawaban = checkEqualizeFraction(fractionSolutions: fractionSolutions, jawaban:jawaban)
                                    if(jawaban.isCheckEqualize){
                                        print("masuk")
                                        stepOneDone = !stepOneDone
                                        isDisabledStep1.toggle()
                                        
                                    }
                                }
                                else if stepOneDone && !stepTwoDone{
                                    jawaban = checkCalculationTimesFactor(fractionSolutions: fractionSolutions, jawaban:jawaban)
                                    if(jawaban.isCheckCalculationTimesFactor){
                                        print("masuk")
                                        stepTwoDone = !stepTwoDone
                                        isDisabledStep2.toggle()
                                    }
                                    
                                }
                                // sekalian cek kalau dia gabisa di simplified lagi pindah ke review
                                else if stepTwoDone && !stepThreeDone{
                                    jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if(jawaban.isCheckCalculation){
                                        stepThreeDone = !stepThreeDone
                                        isDisabledStep3.toggle()
                                        // pindah ke review
                                        // atau tambah alert lagi??
                                        if(!fractionSolutions.canBeSimplified){
                                            isGoToReviewPage.toggle()
                                            print("selesai pindah ke review")
                                            
                                        }else{
                                            
                                        }
                                        
                                    }
                                    
                                }
                                else  if stepThreeDone && !stepSimplify && fractionSolutions.canBeSimplified{
                                    
                                    // pindah ke review
                                    jawaban = checkSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban)
                                    if jawaban.isCheckSimplified{
                                        print("masuk")
                                        stepSimplify.toggle()
                                        isDisabledStepSimplify.toggle()
                                        
                                    }
                                    
                                    // ke review screen
                                    
                                }
                                
                                else if stepSimplify{
                                    // pindah ke review
                                    jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if jawaban.isCheckFinalAnswerSimplified{
                                        print("hasil akhir  udah di simplify")
                                        isGoToReviewPage.toggle()
                                    }
                                    else{
                                        print("gamasuk gagal hasil akbir")
                                    }
                                }
                            }
                            else{
                                if !stepThreeDone{
                                    jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if(jawaban.isCheckCalculation){
                                        stepThreeDone = !stepThreeDone
                                        
                                        // pindah ke revie
                                        if(!fractionSolutions.canBeSimplified){
                                            print("kelar gaada simplify")
                                            //                                    stepSimplify.toggle()
                                            isGoToReviewPage.toggle()
                                            
                                        }
                                        print("masuk")
                                    }
                                    
                                }
                                else if stepThreeDone && !stepSimplify && fractionSolutions.canBeSimplified{
                                    
                                    
                                    jawaban = checkSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban)
                                    if jawaban.isCheckSimplified{
                                        print("masuk")
                                        stepSimplify.toggle()
                                    }
                                    else{
                                        print("gamasuk")
                                    }
                                    // ke review screen
                                    
                                }
                                
                                else if stepSimplify{
                                    // pindah ke review
                                    jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                    if jawaban.isCheckFinalAnswerSimplified{
                                        isGoToReviewPage.toggle()
                                        print("hasil akhir  udah di simplify")
                                    }
                                    else{
                                        print("gamasuk gagal hasil akbir")
                                    }
                                }
                            }
                        }else{
                            if fractionSolutions.canBeSimplified{
                                jawaban = checkFinalAnswerSimplified(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode:isStepMode)
                                if jawaban.isCheckFinalAnswerSimplified{
                                    isGoToReviewPage.toggle()
                                    print("hasil akhir  udah di simplify pindah ke review")
                                }
                                else{
                                    print("gamasuk gagal hasil akbir")
                                }
                            }else if !fractionSolutions.canBeSimplified{
                                jawaban = checkCalculationFraction(fractionSolutions: fractionSolutions, jawaban: jawaban,isStepMode: isStepMode)
                                if(jawaban.isCheckCalculation){
                                    // pindah ke review
                                    // atau tambah alert lagi??
                                    if(!fractionSolutions.canBeSimplified){
                                        isGoToReviewPage.toggle()
                                        print("selesai pindah ke review")
                                        
                                    }
                                }
                            }
                        }
                        //
                        //                    // Check step dari yg paling akhir ke awal
                        //                    if stepThreeDone {
                        //                        isCheck = !isCheck
                        //                    }
                        //
                        //                    if stepTwoDone && !stepThreeDone {
                        //                        stepThreeDone = !stepThreeDone
                        //                    }
                        //
                        //                    if stepOneDone && !stepTwoDone {
                        //                        stepTwoDone = !stepTwoDone
                        //                    }
                        // kalau penyebut beda
                        
                        
                    } label: {
                        
                        if isStepMode && stepTwoDone && !fractionSolutions.canBeSimplified || stepSimplify {
                            Text ("JAWAB")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        else if isStepMode && !stepThreeDone || stepThreeDone && fractionSolutions.canBeSimplified {
                            Text ("CEK")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        else {
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
                    .navigationDestination(isPresented:$isGoToReviewPage){
                        
                        ReviewScreen(fractionSolutions: fractionSolutions, isGoToReviewPage: $isGoToReviewPage,soalPecahan: Soal.fractionPair, operand:operand)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth:.infinity, maxHeight: 130)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: Color ("GrayBlur"), radius: 5, x:0, y:-3)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            .ignoresSafeArea(.all)
            .frame(maxHeight: .infinity)
            .background(.white)
            .padding(.top, 24)
        } else {
            ReviewScreen(fractionSolutions: fractionSolutions, isGoToReviewPage: $isGoToReviewPage, soalPecahan: Soal.fractionPair, operand:operand)
                .navigationBarBackButtonHidden(true)
        }
    }
}


struct QuestionScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        QuestionScreen()
    }
}


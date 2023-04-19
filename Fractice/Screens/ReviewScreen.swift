//
//  ReviewScreen.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import SwiftUI

struct FractionNotation: View {
    var numerator:Int
    var denominator:Int
    
    var body: some View {
        VStack {
            Text("\(numerator)")
            
            Image(systemName: "minus")
            
            Text("\(denominator)")
        }
    }
}

struct StepHeading: View {
    var title:String
    var paddingTop: CGFloat = 24.0
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .padding(.leading, 40)
                Spacer()
            }
            .frame(maxWidth:.infinity)
            .background(Color("PurpleLight"))
            .cornerRadius(9)
        } .padding(.bottom, 12)
    }
}

struct ReviewScreen: View {
    var fractionSolutions:FractionSolutions
    @Binding var isGoToReviewPage:Bool
    var soalPecahan:FractionPair
    var operand:String
    var body: some View {
        NavigationView {
            VStack {
                // Button Atas
//                HStack {
//                    Button {
//
//                    } label: {
//                        Image(systemName: "x.square.fill")
//                            .resizable()
//                            .frame(width: 32, height: 32)
//                            .foregroundColor(.red)
//
//                    }
//
//                    Spacer()
//
//                    Button {
//
//                    } label: {
//                        Image(systemName: "gearshape.fill")
//                            .resizable()
//                            .frame(width: 32, height: 32)
//                            .foregroundColor(.gray)
//                    }
//                }
//                .font(.system(size: 38))
//                .foregroundColor(.gray)
//                .padding(.horizontal, 32)
                
                // Heading
                HStack {
                    Text("Ayo Cek Pemahaman Kamu!")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .lineSpacing(5)
                        .foregroundColor(.white)
                        .padding(.vertical, 24)
                        .padding(.leading, 24)
                    
                    Image("LionSmile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 96)
                        .padding(.all, 24)
                    
                }
                .frame(maxWidth:.infinity)
                .background(Color ("PurpleLight"))
                .cornerRadius(20)
                .shadow(color: Color ("PurpleDark"), radius: 0.1, x:0, y:5)
                .padding(.horizontal, 32)
                .padding(.vertical, 24)
                
                ScrollView {
                    // StepWrapper
                    VStack {
                        SolutionsPrintExample(fractionSolutions: fractionSolutions,soalPecahan:soalPecahan,operand:operand)
                        HStack {
                            Spacer()
                            
                           
                            
                            Spacer()
                        }
                        //                        // Sub Heading
                        //                        StepHeading(title: "Step 1: Equalize Denominator", paddingTop: 0)
                        //
                        //                        // Steps
                        //                        HStack(spacing: 12) {
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "plus")
                        //
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "equal")
                        //
                        //                            FractionNotation(numerator: 2, denominator: 2)
                        //                        }
                        //                    }
                        //
                        //                    VStack {
                        //                        // Sub Heading
                        //                        StepHeading(title: "Step 2: Calculate Problem")
                        //
                        //                        // Steps
                        //                        HStack(spacing: 12) {
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "plus")
                        //
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "equal")
                        //
                        //                            FractionNotation(numerator: 2, denominator: 2)
                        //                        }
                        //                    }
                        //
                        //                    VStack {
                        //                        // Sub Heading
                        //                        StepHeading(title: "Step 3: Calculate Problem")
                        //
                        //                        // Steps
                        //                        HStack(spacing: 12) {
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "plus")
                        //
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "equal")
                        //
                        //                            FractionNotation(numerator: 2, denominator: 2)
                        //                        }
                        //                    }
                        //
                        //                    VStack {
                        //                        // Sub Heading
                        //                        StepHeading(title: "Step 4: Calculate Problem")
                        //
                        //                        // Steps
                        //                        HStack(spacing: 12) {
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "plus")
                        //
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "equal")
                        //
                        //                            FractionNotation(numerator: 2, denominator: 2)
                        //                        }
                        //                    }
                        //
                        //                    VStack {
                        //                        // Sub Heading
                        //                        StepHeading(title: "Step 5: Calculate Problem")
                        //
                        //                        // Steps
                        //                        HStack(spacing: 12) {
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "plus")
                        //
                        //                            FractionNotation(numerator: 1, denominator: 2)
                        //
                        //                            Image(systemName: "equal")
                        //
                        //                            FractionNotation(numerator: 2, denominator: 2)
                        //                        }
                                            }
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Button {
                            isGoToReviewPage.toggle()
                        } label: {
                            Text("LANJUT")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .tracking(5)
                                .foregroundColor(Color .white)
                        }
                        .frame(width: 168, height: 48)
                        .background(LinearGradient(colors: [Color("OrangeLight"), Color("OrangeDark")], startPoint: .top, endPoint: .bottom))
                        .cornerRadius(30)
                        .padding(.vertical, 10)

                        
                    }
                    .frame(maxWidth:.infinity, maxHeight: 50)
                    .background(.white)
                    .cornerRadius(20)
                    
                }
                .ignoresSafeArea(.all)
                .frame(maxHeight: .infinity)
                .background(.white)
                .padding(.top, 24)
                .padding(.bottom, 5)
        }
            
        }
    }

//struct ReviewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewScreen()
//    }
//}

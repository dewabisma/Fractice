//
//  SolutionsPrintExample.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 04/04/23.
//

import SwiftUI


var f1 = generateFraction()
var f2 = generateFraction()

//var f3 =

struct SolutionsPrintExample: View {
    var solution = generateSolutionSteps(f1: f1, f2: f2, operand: Operand.plus)
    var finalSolution = finalAnswer(f1: f1, f2: f2, operand: Operand.plus)
    
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Text("\(f1.numerator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))

                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 36, height: 2)
                        .padding(.vertical, 4)
                    Text("\(f1.denominator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                }
                
                Image(systemName: "plus")
                    .padding(.horizontal)
                
                VStack{
                    Text("\(f2.numerator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 36, height: 2)
                        .padding(.vertical, 4)
                    Text("\(f2.denominator)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("NavyText"))
                }
            }
            
            
            VStack {
                ForEach(0..<solution.steps.count+1, id: \.self) {
                    
                    if !solution.isDenominatorEqual && $0 == 0 {
                        StepHeading(title: "Langkah 1: Samakan penyebut")
                            .padding(.top, 24)
                       
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 12) {
                                    Text("\(f1.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    Image(systemName: "multiply")
                                    Text("\((solution.steps[0] as! TimesFactors).t1)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 90, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 12) {
                                    Text("\(f1.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    Image(systemName: "multiply")
                                    Text("\((solution.steps[0] as! TimesFactors).t1)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                            }
                            
                            Image(systemName: "plus")
                                .padding(.horizontal)
                            
                            VStack{
                                VStack(spacing: 4) {
                                    HStack(spacing: 12) {
                                        Text("\(f2.numerator)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                        Image(systemName: "multiply")
                                        Text("\((solution.steps[0] as! TimesFactors).t2)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                    }
                                    
                                    Image(systemName: "minus")
                                        .resizable()
                                        .frame(width: 90, height: 2)
                                        .padding(.vertical, 4)
                                    
                                    HStack(spacing: 12) {
                                        Text("\(f2.denominator)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                        Image(systemName: "multiply")
                                        Text("\((solution.steps[0] as! TimesFactors).t2)")
                                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                                            .foregroundColor(Color("NavyText"))
                                    }
                                }
                            }
                        }
                    }
                    
                    if !solution.isDenominatorEqual && $0 == 1 {
                        StepHeading(title: "Langkah 2: Hitung operasi aritmatika pecahan")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                Text("\((solution.steps[1] as! FractionPair).f1.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                Text("\((solution.steps[1] as! FractionPair).f1.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                            
                            Image(systemName: "plus")
                                .padding(.horizontal)
                            
                            VStack(spacing: 4) {
                                Text("\((solution.steps[1] as! FractionPair).f2.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                Text("\((solution.steps[1] as! FractionPair).f2.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                        }
                    }
                    
                    if !solution.isDenominatorEqual && solution.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Sederhanakan pecahan")
                            .padding(.top, 24)
                        
                        HStack (spacing: 12) {
                            VStack(spacing: 4) {
                                HStack(spacing: 12) {
                                    Text("\((solution.steps[2] as! SimplifyProperties).operationResult.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[2] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 90, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 12) {
                                    Text("\((solution.steps[2] as! SimplifyProperties).operationResult.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[2] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                            }
                        }
                    }

                    if !solution.isDenominatorEqual && !solution.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Final Answer")
                            .padding(.top, 24)
                        
                        FractionNotation(numerator: finalSolution.numerator, denominator: finalSolution.denominator)
                        
                    }

                    if !solution.isDenominatorEqual && solution.canBeSimplified && $0 == 3 {
                        StepHeading(title: "Langkah 4: Final Answer")
                            .padding(.top, 24)
                        
                        FractionNotation(numerator: finalSolution.numerator, denominator: finalSolution.denominator)
                        
                    }
                    
                    if solution.isDenominatorEqual && $0 == 0 {
                        StepHeading(title: "Langkah 1: Samakan penyebut")
                        
                        HStack {
                            VStack{
                                Text("\(f1.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                Text("\(f1.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                            
                            Image(systemName: "plus")
                                .padding(.horizontal)
                            
                            VStack{
                                Text("\(f2.numerator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                Text("\(f2.denominator)")
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("NavyText"))
                            }
                        }
                    }
                    
                    if solution.isDenominatorEqual && solution.canBeSimplified && $0 == 1 {
                        StepHeading(title: "Langkah 2: Sederhanakan pecahan")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[1] as! SimplifyProperties).operationResult.numerator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[1] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 36, height: 2)
                                    .padding(.vertical, 4)
                                
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[1] as! SimplifyProperties).operationResult.denominator)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[1] as! SimplifyProperties).fpb)")
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color("NavyText"))
         
                                }
                            }
                        }
                    }
                    
                    if solution.isDenominatorEqual && !solution.canBeSimplified && $0 == 1 {
                        StepHeading(title: "Langkah 3: Final Answer")
                            .padding(.top, 24)
                        
                        FractionNotation(numerator: finalSolution.numerator, denominator: finalSolution.denominator)
                        
                    }
                    
                    if solution.isDenominatorEqual && solution.canBeSimplified && $0 == 2 {
                        StepHeading(title: "Langkah 3: Final Answer")
                            .padding(.top, 24)
                        
                        FractionNotation(numerator: finalSolution.numerator, denominator: finalSolution.denominator)
                        
                    }
                    
                    
                }
            }
//            .padding(.top, 24)
        }
    }
}

struct SolutionsPrintExample_Previews: PreviewProvider {
    static var previews: some View {
        SolutionsPrintExample()
    }
}

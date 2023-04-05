//
//  SolutionsPrintExample.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 04/04/23.
//

import SwiftUI


var f1 = generateFraction()
var f2 = generateFraction()

struct SolutionsPrintExample: View {
    var solution = generateSolutionSteps(f1: f1, f2: f2, operand: Operand.plus)
    
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Text("\(f1.numerator)")
                    Image(systemName: "minus")
                    Text("\(f1.denominator)")
                }
                
                Image(systemName: "plus")
                
                VStack{
                    Text("\(f2.numerator)")
                    Image(systemName: "minus")
                    Text("\(f2.denominator)")
                }
            }
            
            
            VStack {
                ForEach(0..<solution.steps.count, id: \.self) {
                    if !solution.isDenominatorEqual && $0 == 0 {
                        Text("Step 1: Equalize Fractions")
                       
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Text("\(f1.numerator)")
                                    Image(systemName: "multiply")
                                    Text("\((solution.steps[0] as! TimesFactors).t1)")
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 70, height: 1)
                                
                                HStack(spacing: 2) {
                                    Text("\(f1.denominator)")
                                    Image(systemName: "multiply")
                                    Text("\((solution.steps[0] as! TimesFactors).t1)")
                                }
                            }
                            
                            Image(systemName: "plus")
                            
                            VStack{
                                VStack(spacing: 4) {
                                    HStack(spacing: 2) {
                                        Text("\(f2.numerator)")
                                        Image(systemName: "multiply")
                                        Text("\((solution.steps[0] as! TimesFactors).t2)")
                                    }
                                    
                                    Image(systemName: "minus")
                                        .resizable()
                                        .frame(width: 70, height: 1)
                                    
                                    HStack(spacing: 2) {
                                        Text("\(f2.denominator)")
                                        Image(systemName: "multiply")
                                        Text("\((solution.steps[0] as! TimesFactors).t2)")
                                    }
                                }
                            }
                        }
                    }
                    
                    if !solution.isDenominatorEqual && $0 == 1 {
                        Text("Step 2: Calculate").padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                Text("\((solution.steps[1] as! FractionPair).f1.numerator)")
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width:20, height:1)
                                
                                Text("\((solution.steps[1] as! FractionPair).f1.denominator)")
                            }
                            
                            Image(systemName: "plus")
                            
                            VStack(spacing: 4) {
                                Text("\((solution.steps[1] as! FractionPair).f2.numerator)")
                              
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width:20, height:1)
                                
                                Text("\((solution.steps[1] as! FractionPair).f2.denominator)")
                            }
                        }
                    }
                    
                    if !solution.isDenominatorEqual && solution.canBeSimplified && $0 == 2 {
                        Text("Step 3: Simplify Fraction")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[2] as! SimplifyProperties).operationResult.numerator)")
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[2] as! SimplifyProperties).fpb)")
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 70, height: 1)
                                
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[2] as! SimplifyProperties).operationResult.denominator)")
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[2] as! SimplifyProperties).fpb)")
                                }
                            }
                        }
                    }
                    
                    if solution.isDenominatorEqual && $0 == 0 {
                        Text("Step 1: Calculate")
                        
                        HStack {
                            VStack{
                                Text("\(f1.numerator)")
                                Image(systemName: "minus")
                                Text("\(f1.denominator)")
                            }
                            
                            Image(systemName: "plus")
                            
                            VStack{
                                Text("\(f2.numerator)")
                                Image(systemName: "minus")
                                Text("\(f2.denominator)")
                            }
                        }
                    }
                    
                    if solution.isDenominatorEqual && solution.canBeSimplified && $0 == 1 {
                        Text("Step 2: Simplify Fraction")
                            .padding(.top, 24)
                        
                        HStack {
                            VStack(spacing: 4) {
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[1] as! SimplifyProperties).operationResult.numerator)")
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[1] as! SimplifyProperties).fpb)")
                                }
                                
                                Image(systemName: "minus")
                                    .resizable()
                                    .frame(width: 70, height: 1)
                                
                                HStack(spacing: 2) {
                                    Text("\((solution.steps[1] as! SimplifyProperties).operationResult.denominator)")
                                    
                                    Image(systemName: "divide")
                                    
                                    Text("\((solution.steps[1] as! SimplifyProperties).fpb)")
         
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 24)
        }
    }
}

struct SolutionsPrintExample_Previews: PreviewProvider {
    static var previews: some View {
        SolutionsPrintExample()
    }
}

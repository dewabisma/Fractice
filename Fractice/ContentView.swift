//
//  ContentView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 29/03/23.
//

import SwiftUI

struct ContentView: View {    
    var fraction1 = generateFraction(maxVal: 100)
    var fraction2 = generateFraction(maxVal: 10)
    
    var answer:Bool = checkAnswer(
        userAnswer: 5/6,
        operand: Operand.plus,
        f1: 2/6,
        f2: 3/6
    )
    
    var body: some View {
        VStack {
            VStack{
                Text("f1 numerator: \(fraction1.numerator)")
                Text("f1 denominator: \(fraction1.denominator)")
            }
            
            VStack{
                Text("f2 numerator: \(fraction2.numerator)")
                Text("f2 denominator: \(fraction2.denominator)")
            }
            
            if answer {
                Text("Correct")
            } else {
                Text("Wrong")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 29/03/23.
//

import SwiftUI

struct ContentView: View {    
    var fraction1 = generateFraction()
    var fraction2 = generateFraction()
    
    var answer:Bool = checkAnswer(
        userAnswer: 5/6,
        operand: Operand.plus,
        f1: 2/6,
        f2: 3/6
    )
    
    
    
    var body: some View {
        VStack {
            Text("numerator: \(fraction1.numerator)")
            Text("denominator: \(fraction2.denominator)")
            
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

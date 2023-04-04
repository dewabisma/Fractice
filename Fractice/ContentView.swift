//
//  ContentView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 29/03/23.
//

import SwiftUI


struct ContentView: View {
    var solution = generateSolutionSteps(f1: f1, f2: f2, operand: Operand.plus)
    
    
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

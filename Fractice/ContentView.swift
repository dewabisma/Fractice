//
//  ContentView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 29/03/23.
//

import SwiftUI

struct ContentView: View {    
    var fraction = generateFraction()
    
    var body: some View {
        VStack {
            Text("numerator: \(fraction.numerator)")
            Text("denominator: \(fraction.denominator)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

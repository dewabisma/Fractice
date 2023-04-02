//
//  ContentView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 29/03/23.
//

import SwiftUI

struct ContentView: View {    
    var KPK:Int = getKPK(num1: 48, num2: 12)
    
    var body: some View {
        VStack {
            Text("\(KPK)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

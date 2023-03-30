//
//  TestRectanglePuzzle.swift
//  Fraction
//
//  Created by Bisma Mahendra I Dewa Gede on 30/03/23.
//

import SwiftUI

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct Fraction:View {
    var numerator: Int
    var denominator:Int
    
    let columns: [GridItem] = [
        GridItem(.fixed(20), spacing: 2, alignment: nil),
        GridItem(.fixed(20), spacing: 2, alignment: nil),
        GridItem(.fixed(20), spacing: 2, alignment: nil),
        GridItem(.fixed(20), spacing: 2, alignment: nil),
        GridItem(.fixed(20), spacing: 2, alignment: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<numerator) { _ in
                Square()
                    .fill(.red)
                    .frame(width:20, height: 20)
            }
            
            
            ForEach(0..<abs(denominator - numerator)) { _ in
                Square()
                    .stroke(.red, lineWidth: 2)
                    .frame(width:18, height: 18)
            }
            
        }
    }
}

struct FractionGenerator: View {
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Fraction(numerator: 2, denominator: 4)
                    
                    Spacer()
                    
                    Text("+").font(.largeTitle)
                    
                    Spacer()
                    
                    Fraction(numerator: 1, denominator: 10)
                }
                
                Spacer()
                
                
            }
            .navigationTitle("Fraction Problem")
            .padding([.horizontal], 12)
        }
    }
}

struct FractionGenerator_Previews: PreviewProvider {
    static var previews: some View {
        FractionGenerator()
    }
}

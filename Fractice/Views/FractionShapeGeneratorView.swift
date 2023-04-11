//
//  FractionShapeGeneratorView.swift
//  Fractice
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

struct FractionShape:View {
    var numerator: Int
    var denominator:Int
    
    let columns: [GridItem] = [
        GridItem(.fixed(30), spacing: 4, alignment: nil),
        GridItem(.fixed(30), spacing: 4, alignment: nil),
        GridItem(.fixed(30), spacing: 4, alignment: nil),
//        GridItem(.fixed(30), spacing: 4, alignment: nil),
//        GridItem(.fixed(30), spacing: 4, alignment: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 4) {
            ForEach(0..<numerator, id: \.self) { index in
                Square()
                    .fill(.white)
                   
                    .frame(width:30, height: 30)
                    .id("numerator\(index)")
            }
            
            
            ForEach(0..<abs(denominator - numerator), id: \.self ) { index in
                Square()
                    .stroke(.white, lineWidth: 2)
                    .frame(width:28, height: 28)
                    .id("denominator\(index)")
            }
        }
    }
}



//
//  ReviewView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 02/04/23.
//

import SwiftUI

struct Fraction: View {
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
        HStack {
            Text(title)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .padding(.vertical, 8)
                .padding(.leading, 16)
            
            Spacer()
        }
        .frame(maxWidth:.infinity)
        .background(.gray)
        .cornerRadius(9)
        .padding(.top, paddingTop)
    }
}

struct ReviewView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Button Atas
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "x.square.fill")
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
                .font(.system(size: 38))
                .foregroundColor(.gray)
                
                // Heading
                HStack(spacing: 18) {
                    StrokeText(text: "Review \nyour problem", width: 1, color: .white)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .padding(.vertical, 24)
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 89)
                        .padding(.vertical, 24)
                    
                }
                .frame(maxWidth:.infinity)
                .background(.gray)
                .cornerRadius(20)
                .padding(.top, 24)
                
                ScrollView {
                    // StepWrapper
                    VStack {
                        // Sub Heading
                        StepHeading(title: "Step 1: Equalize Denominator", paddingTop: 0)
                        
                        // Steps
                        HStack(spacing: 12) {
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "plus")
                            
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "equal")
                            
                            Fraction(numerator: 2, denominator: 2)
                        }
                    }
                    
                    VStack {
                        // Sub Heading
                        StepHeading(title: "Step 2: Calculate Problem")
                        
                        // Steps
                        HStack(spacing: 12) {
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "plus")
                            
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "equal")
                            
                            Fraction(numerator: 2, denominator: 2)
                        }
                    }
                    
                    VStack {
                        // Sub Heading
                        StepHeading(title: "Step 3: Calculate Problem")
                        
                        // Steps
                        HStack(spacing: 12) {
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "plus")
                            
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "equal")
                            
                            Fraction(numerator: 2, denominator: 2)
                        }
                    }
                    
                    VStack {
                        // Sub Heading
                        StepHeading(title: "Step 4: Calculate Problem")
                        
                        // Steps
                        HStack(spacing: 12) {
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "plus")
                            
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "equal")
                            
                            Fraction(numerator: 2, denominator: 2)
                        }
                    }
                    
                    VStack {
                        // Sub Heading
                        StepHeading(title: "Step 5: Calculate Problem")
                        
                        // Steps
                        HStack(spacing: 12) {
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "plus")
                            
                            Fraction(numerator: 1, denominator: 2)
                            
                            Image(systemName: "equal")
                            
                            Fraction(numerator: 2, denominator: 2)
                        }
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                // Button Next
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                    }
                    .background(LinearGradient(
                        gradient: Gradient(colors: [.black, .gray]),
                        startPoint: .top,
                        endPoint: .bottom)
                    )
                    .cornerRadius(20)
                }
                .padding(.top, 24)
                .padding(.bottom, 48)
                
            }
        }
        .padding(.horizontal, 32)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}

//
//  ClosePromptView.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 04/04/23.
//

import SwiftUI

struct ClosePromptView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Kamu Yakin Nih, Mau Berhenti Latihan?")
                Image("LionSad")
                
                HStack{
                    Button("Tidak"){
                        
                    }
                    .frame(maxWidth: 116, maxHeight: 48)
                    .background(Color("OrangeLight"))
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
                    
                    Button("Yup"){
                        
                    }
                    .frame(maxWidth: 116, maxHeight: 48)
                    .overlay (RoundedRectangle(cornerRadius: 30)
                        .stroke(Color ("OrangeLight"), lineWidth: 2))
                    .background(.white)
                    .cornerRadius(20)
                    .foregroundColor(Color("OrangeLight"))
                    .fontWeight(.heavy)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 280)
            .background(Color("PurpleLight"))
            .foregroundColor(Color.white)
            .fontWeight(.heavy)
            .cornerRadius(20)
            .shadow(color:Color("PurpleDark"), radius: 0, x: 0, y: 2)
        }
        .padding(.horizontal,32)
        .padding(.top, 32)
    }
}

struct ClosePromptView_Previews: PreviewProvider {
    static var previews: some View {
        ClosePromptView()
    }
}

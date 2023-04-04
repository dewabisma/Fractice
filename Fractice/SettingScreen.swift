//
//  SettingScreen.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 04/04/23.
//

import SwiftUI

struct SettingScreen: View {
    @State private var vibrateOnBilangan = false
    @State private var vibrateOnCerita = false
    @State private var vibrateOnGambar = false
    
    var body: some View {
        ZStack {
            VStack (spacing:50) {
                VStack {
                    Spacer ()
                    Image("LionSmile")
                        .resizable()
                        .frame(width: 125, height:100)
                    Text("FRACTICE")
                        .font(.system(size: 26))
                        .foregroundColor(Color("OrangeLight"))
                        .fontWeight(.heavy)
                        .tracking(5)
                        .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                }
                .frame(maxWidth:.infinity,maxHeight: 200)

                VStack{
                    Text("Pilih Tipe Soal Pecahan Kamu!")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("OrangeDark"))
                        .padding(.bottom,40)
                        
                    HStack{
                        Text("Soal Bilangan Pecahan")
                            .font(.system(size:18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(10)
                        Spacer()
                        
                        Toggle(isOn: $vibrateOnBilangan) {
                            }
                        .frame(maxWidth: 50)
                        .padding(10)
                        
                        
                    }
                    .frame(maxWidth: 327, maxHeight: 68)
                    .background(Color("PurpleLight"))
                    .cornerRadius(20)
                    .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                    .padding(.bottom,40)
                    
                    HStack{
                        Text("Soal Cerita Pecahan")
                            .font(.system(size:18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(10)
                        Spacer()
                        
                        Toggle(isOn: $vibrateOnCerita) {
                            }
                        .frame(maxWidth: 50)
                        .padding(10)
                        
                    }
                    .frame(maxWidth: 327, maxHeight: 68)
                    .background(Color("PurpleLight"))
                    .cornerRadius(20)
                    .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                    .padding(.bottom,40)
                    
                    
                    HStack{
                        Text("Soal Gambar Pecahan")
                            .font(.system(size:18))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(10)
                        Spacer()
                        
                        Toggle(isOn: $vibrateOnGambar) {
                            }
                        .frame(maxWidth: 50)
                        .padding(10)
                        
                        
                    }
                    .frame(maxWidth: 327, maxHeight: 68)
                    .background(Color("PurpleLight"))
                    .cornerRadius(20)
                    .padding(.bottom,40)
                    .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                    
                    Button("Mulai!") { print ("button tapped")}
                        .tracking(5)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(maxWidth: 132, maxHeight: 48)
                        .background(LinearGradient(colors:[Color("OrangeDark"),Color("OrangeLight")], startPoint:.bottom, endPoint:.top))
                        .cornerRadius(30)
                    
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
            }
            .edgesIgnoringSafeArea(.all)
            .frame( maxHeight: .infinity)
            .background(Color("PurpleLight"))
           
        }
    }}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}

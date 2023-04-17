//
//  SettingScreen.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 04/04/23.
//

import SwiftUI

struct ModeSoal:View {
    @Binding var vibrate:Bool
    var title:String
    @Binding var setting:QuestionType
    var body: some View {
        HStack{
            Text(title)
                .font(.system(size:18))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(10)
            Spacer()
            
            Toggle(isOn: $vibrate) {
                
            }
            .onChange(of: vibrate){newValue in
                if !newValue{
//                    print("masuk atas")
                    if !setting.isGambar && !setting.isBilangan && !setting.isCerita{
//                        print("masuk sini")
                        vibrate = true
                    }
                }
            }
            .frame(maxWidth: 50)
            .padding(10)
            
            
        }
        .frame(maxWidth: 327, maxHeight: 68)
        .background(Color("PurpleLight"))
        .cornerRadius(20)
        .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
        .padding(.bottom,40)
    }
}

struct SettingScreen: View {
    @Binding var isPresented:Bool
    @Binding var setting:QuestionType
    @State var isShowingAlert = false
    
    var body: some View {
        ZStack {
            VStack (spacing:50) {
                Spacer()
                VStack {
                    Image("LionSmile")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200)
//                        .background(.red)
                    Text("FRACTICE")
                        .font(.system(size: 26))
                        .foregroundColor(Color("OrangeLight"))
                        .fontWeight(.heavy)
                        .tracking(5)
                        .shadow(color:Color("PurpleDark"), radius: 0.1, x:0, y:5)
                }
//                .background(.yellow)
                .frame(maxWidth:.infinity,maxHeight: 200)

                VStack{
                    Text("Pilih Tipe Soal Pecahan !")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("OrangeDark"))
                        .padding(.bottom,40)
                        
                    ModeSoal(vibrate: $setting.isBilangan,title:"Soal Bilangan Pecahan",setting:$setting)
                      
                    
                    ModeSoal(vibrate: $setting.isCerita,title:"Soal Cerita Pecahan",setting:$setting)
                    
                    
                    ModeSoal(vibrate: $setting.isGambar,title:"Soal Gambar Pecahan",setting:$setting)
                       
                   
                    
//                    Button("Mulai!") {
//                        if(!setting.isGambar && !setting.isCerita && !setting.isBilangan){
//                            isShowingAlert.toggle()
//                        }
//                        else{
//                            isPresented.toggle()
//                        }
//                    }
//                        .alert("Pilih salah satu opsi", isPresented: $isShowingAlert) {
//                                Button("OK", role: .cancel) { }
//                        }
//                        .tracking(5)
//                        .foregroundColor(.white)
//                        .fontWeight(.heavy)
//                        .frame(maxWidth: 132, maxHeight: 48)
//                        .background(LinearGradient(colors:[Color("OrangeDark"),Color("OrangeLight")], startPoint:.bottom, endPoint:.top))
//                        .cornerRadius(30)
//                        
                    
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
            }
            .edgesIgnoringSafeArea(.bottom)
            .frame( maxHeight: .infinity)
            .background(Color("PurpleLight"))
           
        }
    }}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen(isPresented: .constant(false),setting: .constant(QuestionType(isBilangan: true,isCerita: false,isGambar: false)))
    }
}

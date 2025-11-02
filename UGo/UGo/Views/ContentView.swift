//
//  ContentView.swift
//  UGo
//
//  Created by s11 on 17/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("LogoIniz").resizable().frame(width: .infinity, height: 400).padding(.bottom, 50)
                
                NavigationLink(destination: Login()){
                    ButtonsSemplici(Testo: "Login")
                }
                
                NavigationLink(destination: Registrazione()){
                    ButtonsSemplici(Testo: "Register")
                }.padding(.top, 20)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarBackButtonHidden(true)
                .background(Color.lightGreen)
        }
        
    }
}

#Preview {
    ContentView()
}

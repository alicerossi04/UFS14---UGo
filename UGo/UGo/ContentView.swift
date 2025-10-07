//
//  ContentView.swift
//  UGo
//
//  Created by s11 on 07/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Logo").resizable().frame(width: 100, height: 100)
            Text("Sign up").font(.largeTitle).fontWeight(.thin)
            
            VStack (alignment: .leading){
                Text("Email")
                TextField("", text: .constant(""))
                    .frame(maxWidth: 300, maxHeight: 60)
                    .background(Color.white)
                    .cornerRadius(5)
                
                Text("Password")
                    .padding(.top, 30)
                TextField("", text: .constant(""))
                    .frame(maxWidth: 300, maxHeight: 60)
                    .background(Color.white)
                    .cornerRadius(5)
                
            } .padding(.bottom, 30)
            
            
            
            Button(action: {}) {
                Text("Sign up")
                    .frame(maxWidth: 170)
                    .font(.title).fontWeight(.thin)
                    .padding(10)
                    .background(Color.licorice)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Or register with")
                .padding(.top, 30)
            
            HStack{
                Button(action: {}) {
                    Image("Google").resizable().frame(width: 30, height: 30)
                } .padding().frame(width: 100, height: 70)
                    .background(Color.licorice)
                    .cornerRadius(10)
                
                Button(action: {}) {
                    Image("Apple").resizable().frame(width: 30, height: 30)
                } .padding().frame(width: 100, height: 70)
                    .background(Color.licorice)
                    .cornerRadius(10)

                Button(action: {}) {
                    Image("GitHub").resizable().frame(width: 30, height: 30)
                } .padding().frame(width: 100, height: 70)
                    .background(Color.licorice)
                    .cornerRadius(10)

            
            }
            
            Text("Already have an account? Log in").padding(.top, 30)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.milGreen)

        
    }
    
}

#Preview {
    ContentView()
}

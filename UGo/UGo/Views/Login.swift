//
//  ContentView.swift
//  UGo
//
//  Created by s11 on 07/10/25.
//

import SwiftUI

struct Login: View {
    
    @State var Username: String = ""
    @State var Email: String = ""
    @State var Password: String = ""
    
    var isUsernameValid: Bool {
        !Username.isEmpty
    }
    
    var isEmailValid: Bool {
        !Email.isEmpty && Email.contains("@")
    }
    
    var isPasswordValid: Bool {
        !Password.isEmpty && Password.count >= 7
    }
    
    var valido: Bool {
        isUsernameValid &&
        isPasswordValid
    }
    
    var body: some View {
//        NavigationView {
            VStack {
                Image("Logo").resizable().frame(width: 100, height: 100)
                Text("Log in").font(.largeTitle).fontWeight(.thin)
                
                VStack (alignment: .leading){
                    TextBoxes(
                        Icon: "person.circle",
                        TextValue: $Username,
                        isMandatory: true,
                        isValid: isUsernameValid,
                        isSecret: false,
                        TextHint: "Username"
                    )
                    
                    TextBoxes(
                        Icon: "lock",
                        TextValue: $Password,
                        isMandatory: true,
                        isValid: isPasswordValid,
                        isSecret: true,
                        TextHint: "Password",
                        Icon2: "eye"
                    )
                    
                }.padding(.bottom, 30)
                
                NavigationLink(destination: Homepage()){
                        Buttons(
                            Testo: "Log in"
                        )
                }.disabled(!valido)
                
                Text("Or log back in with")
                    .padding(.top, 30)
                
                HStack{
                    ButtonsApi(Immagine: "Google")
                    ButtonsApi(Immagine: "Apple")
                    ButtonsApi(Immagine: "GitHub")
                }
                
                NavigationLink(destination: ContentView()) {
                    Text("Don't have an account yet? Sign up").padding(.top, 30).foregroundColor(.black)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.milGreen)

            
        //}
    }
}

#Preview {
    Login()
}

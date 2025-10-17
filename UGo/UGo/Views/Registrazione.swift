//
//  ContentView.swift
//  UGo
//
//  Created by s11 on 07/10/25.
//

import SwiftUI

struct Registrazione: View {
    
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
        isPasswordValid &&
        isEmailValid
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo").resizable().frame(width: 100, height: 100)
                Text("Sign up").font(.largeTitle).fontWeight(.thin)
                
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
                        Icon: "envelope",
                        TextValue: $Email,
                        isMandatory: true,
                        isValid: isEmailValid,
                        isSecret: false,
                        TextHint: "Email"
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
                    
                } .padding(.bottom, 30)
                
                
                NavigationLink(destination: Homepage()){
                        Buttons(
                            Testo: "Sign up"
                        )
                }.disabled(!valido)
                
                Text("Or register with")
                    .padding(.top, 30)
                
                HStack{
                    ButtonsApi(Immagine: "Google")
                    ButtonsApi(Immagine: "Apple")
                    ButtonsApi(Immagine: "GitHub")
                }
                
                NavigationLink(destination: Login()) {
                    Text("Already have an account? Log in").padding(.top, 30).foregroundColor(.black)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.milGreen)

            
        }
    }
}

#Preview {
    Registrazione()
}

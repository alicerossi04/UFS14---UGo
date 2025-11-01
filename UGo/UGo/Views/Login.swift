//
//  ContentView.swift
//  UGo
//
//  Created by s11 on 07/10/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct Login: View {
    
    @State var Username: String = ""
    @State var Email: String = ""
    @State var Password: String = ""
    
    @State private var errorMessage: String = ""
    @State private var isLoggedIn: Bool = false
    
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
        isEmailValid &&
        isPasswordValid
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo").resizable().frame(width: 100, height: 100)
                Text("Log in").font(.largeTitle).fontWeight(.thin).foregroundStyle(.licorice)
                
                VStack (alignment: .leading){
                    TextBoxes(
                        Icon: "person.circle",
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
                    
                }.padding(.bottom, 30)
                
                Buttons(Testo: "Log in", action: login).disabled(!valido)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage).foregroundColor(.red)
                }
                
                Text("Or log back in with")
                    .padding(.top, 30)
                
                HStack{
                    ButtonsApi(Immagine: "Google")
                    ButtonsApi(Immagine: "Apple")
                    ButtonsApi(Immagine: "GitHub")
                }
                
                NavigationLink(destination: Registrazione()) {
                    Text("Don't have an account yet? Sign up").padding(.top, 30).foregroundColor(.black)
                }
                
                NavigationLink(destination: Homepage(), isActive: $isLoggedIn){
                    EmptyView()
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.milGreen)
                

            //.navigationBarBackButtonHidden(true) da mettere per togliere "back"
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: Email, password: Password){
            authResult, error in
            if error != nil {
                print("Errore login")
                errorMessage = "Login failed, please try again"
                isLoggedIn = false
                return
            } else {
                errorMessage = ""
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    Login()
}

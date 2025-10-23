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
        NavigationStack {
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
                    /*Buttons(
                     Testo: "Log in"
                     )*/
                    Button{
                        login()
                    } label: {
                        Text("Log in")
                    }.frame(maxWidth: 170)
                        .font(.title).fontWeight(.thin)
                        .padding(10)
                        .background(Color.licorice)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.disabled(!valido)
                
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
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.milGreen)
                

            //.navigationBarBackButtonHidden(true) da mettere per togliere "back"
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: Email, password: Password){result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    Login()
}

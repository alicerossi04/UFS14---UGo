//
//  UserProfile.swift
//  UGo
//
//  Created by Alice Rossi on 01/11/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct UserProfile: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var showingLogin = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Profile").font(.largeTitle).fontWeight(.thin).foregroundStyle(.licorice)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.licorice)
                    .padding(.top, 50)
                
                Text("alice04")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundStyle(.licorice)
                
                Text(verbatim: "alice@gmail.co")
                    .font(.subheadline)
                    .foregroundStyle(.licorice)
                    .padding(.bottom, 50)
                
                NavigationLink(destination: Login()) {
                    ButtonsSemplici(Testo: "Logout")
                        .padding(.horizontal, 50)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.milGreen)
        }
    }
}

#Preview {
    UserProfile()
}

//
//  UGoApp.swift
//  UGo
//
//  Created by s11 on 07/10/25.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct UGoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

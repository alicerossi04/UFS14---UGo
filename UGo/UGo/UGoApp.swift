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
            switch ScreenshotMode.screen {
            case "login": NavigationStack { Login() }
            case "register": NavigationStack { Registrazione() }
            case "home": NavigationStack { Homepage() }
            case "detail": NavigationStack { PaginaDettagli(itinerario: Itinerario.esempio) }
            case "profile": UserProfile()
            default: ContentView()
            }
        }
    }
}

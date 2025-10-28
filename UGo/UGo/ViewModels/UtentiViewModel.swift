//
//  UtentiViewModel.swift
//  UGo
//
//  Created by s11 on 28/10/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class UtentiViewModel {
    
    func fetchUtenti(completion: @escaping ([Utenti]) -> Void) {
        let db = Firestore.firestore()
        db.collection("Utenti").getDocuments { snapshot, error in
            guard let docs = snapshot?.documents else {
                completion([])
                return
            }
            let utenti = docs.compactMap { try? $0.data(as: Utenti.self) }
            completion(utenti)
        }
    }
}

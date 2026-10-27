//
//  ItinerarioViewModel.swift
//  UGo
//
//  Created by Alice Rossi on 23/10/25.
//

import SwiftUI
import FirebaseFirestore

class ItinerarioViewModel {
    
    func fetchItinerari(completion: @escaping ([Itinerario]) -> Void) {
        if ScreenshotMode.useMock { completion(Itinerario.esempi); return }
        let db = Firestore.firestore()
        db.collection("Itinerari").getDocuments { snapshot, error in
            guard let docs = snapshot?.documents else {
                completion([])
                return
            }
            let itinerari = docs.compactMap { try? $0.data(as: Itinerario.self) }
            completion(itinerari)
        }
    }
}


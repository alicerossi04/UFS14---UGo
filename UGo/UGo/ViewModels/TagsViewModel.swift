//
//  TagsViewModel.swift
//  UGo
//
//  Created by Alice Rossi on 24/10/25.
//

import SwiftUI
import FirebaseFirestore

class TagsViewModel {
    
    func fetchTags(completion: @escaping ([Tags]) -> Void) {
        if ScreenshotMode.useMock { completion(Tags.esempi); return }
        let db = Firestore.firestore()
        db.collection("Tags").getDocuments { snapshot, error in
            guard let docs = snapshot?.documents else {
                completion([])
                return
            }
            let tags = docs.compactMap { try? $0.data(as: Tags.self) }
            completion(tags)
        }
    }
}

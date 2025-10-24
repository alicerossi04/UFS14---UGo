//
//  Tags.swift
//  UGo
//
//  Created by Alice Rossi on 24/10/25.
//

import SwiftUI
import FirebaseFirestore

struct Tags: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: Int
    var nome_tag: String
}

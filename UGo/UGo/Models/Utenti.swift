//
//  Utenti.swift
//  UGo
//
//  Created by Alice Rossi on 23/10/25.
//

import SwiftUI

struct Utenti: Identifiable, Decodable {
    let id = UUID()
    let ID : Int
    var Username: String
    var Email: String
}

//
//  Itinerari.swift
//  UGo
//
//  Created by Alice Rossi on 23/10/25.
//

import SwiftUI
import FirebaseFirestore

struct Itinerario: Identifiable, Codable {
    @DocumentID var id: String?
    var Coordinate_E: String
    var Coordinate_S: String
    var ID: Int
    var difficolta: String
    var regione: String
    var tag: String
    var tappe_itinerario: [String]
    var descrizione: String
    var distanza_km: String
    var durata_ore: String
    var nome: String
    var URL_immagine: String?
}

//
//  Ricetta.swift
//  UGo
//
//  Created by s11 on 21/10/25.
//

import SwiftUI

struct RicetteWrapper: Codable {
    let recipes: [Ricetta]
}

struct Ricetta: Codable, Identifiable {
    let id = UUID()
    var name: String
    var ingredients: [String]
    var instructions: [String]
    var cuisine : String
    var prepTimeMinutes : Int
    var cookTimeMinutes : Int
    var difficulty : String
    var image : String
}

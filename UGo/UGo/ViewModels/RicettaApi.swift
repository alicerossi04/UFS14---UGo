//
//  RicettaApi.swift
//  UGo
//
//  Created by s11 on 21/10/25.
//
import SwiftUI

class Api : ObservableObject{
    @Published var ricette = [Ricetta]()
    
    func loadAllRecipesData(completion:@escaping ([Ricetta]) -> ()) {
        guard let url = URL(string: "https://dummyjson.com/recipes") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let wrapper = try! JSONDecoder().decode(RicetteWrapper.self, from: data!)
            let ricette = wrapper.recipes
            
            DispatchQueue.main.async {
                completion(ricette)
            }
        }.resume()
    }
}

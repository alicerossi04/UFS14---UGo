//
//  Textboxes.swift
//  UGo
//
//  Created by s11 on 17/10/25.
//

import SwiftUI

//textbox custom
struct TextBoxes : View {
    var Icon: String
    @Binding var TextValue: String
    var isMandatory: Bool = false
    var isValid: Bool = true
    @State var isSecret: Bool = true
    var TextHint: String
    var Icon2: String = ""
    
    var body: some View {
        
        HStack {
            
            Image(systemName: Icon)
            
            if isSecret {
                SecureField(TextHint, text: $TextValue)
            } else {
                TextField(TextHint, text: $TextValue)
            }
            
            if !Icon2.isEmpty {
                Button(action: {
                    isSecret.toggle()
                }) {
                    Image(systemName: isSecret ? "eye.slash" : "eye")
                        .foregroundColor(.black)
                }
            }

        }.padding(10).frame(maxWidth: 300, maxHeight: 60).background(Color.white).cornerRadius(
            5).foregroundColor(.licorice).overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                        isMandatory && !isValid ? Color.red : Color.gray,
                        lineWidth: 1
                    )
            ).padding(.top)
    }
}

//bottoni custom log in e sign up (da aggiornare mettendo funzione!!!!)
struct Buttons : View {
    var Testo: String
    
    var body : some View {
        Text(Testo)
            .frame(maxWidth: 170)
            .font(.title).fontWeight(.thin)
            .padding(10)
            .background(Color.licorice)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

//bottoni custom log in api
struct ButtonsApi : View {
    var Immagine: String
    
    var body: some View {
        Button(action: {}) {
            Image(Immagine).resizable().frame(width: 30, height: 30)
        } .padding().frame(width: 100, height: 70)
            .background(Color.licorice)
            .cornerRadius(10)
    }
}

//bottoni custom per tag
struct ButtonsTags : View {
    var Immagine: String
    var Testo: String
    
    var body : some View {
        HStack{
            Image(systemName: Immagine)
            Text(Testo)
                .frame(maxWidth: 170)
                .font(.body)
        }.padding(10)
            .background(.licorice)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}


//struttura base per card singola
struct RecipeCardView: View {
    let ricetta: Ricetta

    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: ricetta.image)) { image in image
            .resizable()
            .aspectRatio(contentMode: .fill)
            } placeholder: {}
            .frame(height: 120)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 3)

            Text(ricetta.name)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundColor(.licorice)

            VStack {
                Text(ricetta.cuisine)
                    .font(.caption)
                Text("\(ricetta.prepTimeMinutes) min")
                    .font(.caption)
            }.foregroundColor(.licorice)
        }
        .padding(8)
        .background(.white)
        .cornerRadius(10)
    }
}

//distribuzione card in griglia
struct RicettaCardApi: View {
    @State var ricette = [Ricetta]()
        
        private var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(ricette) { ricetta in
                            RecipeCardView(ricetta: ricetta)
                        }
                    }
                    .padding()
                }
                .background(Color.milGreen)
                .onAppear() {
                    Api().loadAllRecipesData { (ricetteCaricate) in
                        self.ricette = ricetteCaricate
                    }
                }
            }
        }
}

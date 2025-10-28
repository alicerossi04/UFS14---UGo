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

//bottoni custom log in e sign up (con funzione)
struct Buttons : View {
    var Testo: String
    var action: () -> Void
    
    var body : some View {
        Button(action: {
            action()
        }){
            Text(Testo)
                .frame(maxWidth: 170)
                .font(.title).fontWeight(.thin)
                .padding(10)
                .background(Color.licorice)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

//bottoni custom log in e sign up (senza funzione)
struct ButtonsSemplici : View {
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
    var Testo: String
    
    var body : some View {
        HStack{
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
struct ItinerariCardView: View {
    let itinerario: Itinerario

    var body: some View {
        VStack(alignment: .leading) {
            if let urlString = itinerario.URL_immagine,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 160, height: 120)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 3)
            }

            Text(itinerario.nome)
                .font(.subheadline)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(.licorice)

            VStack {
                Text(itinerario.durata_ore)
                    .font(.caption)
                Text(itinerario.distanza_km)
                    .font(.caption)
            }
            .foregroundColor(.black)
        }
        .padding(8)
        .background(.white)
        .cornerRadius(10)
    }
}


//distribuzione card in griglia
struct ItinerariCard: View {
    let itinerari: [Itinerario]

    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(itinerari: [Itinerario] = []){
        self.itinerari = itinerari
    }

    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(itinerari) { itin in
                        NavigationLink(destination: PaginaDettagli(itinerario: itin)){
                            ItinerariCardView(itinerario: itin)
                        }
                    }
                }
                .padding()
            }
            .background(.milGreen)
        }
    }

//lista di tag
struct ListaTags: View {
    @State private var tags = [Tags]()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.id) { tag in
                    ButtonsTags(Testo: tag.nome_tag)
                }
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .onAppear {
            TagsViewModel().fetchTags { tagsCaricati in
                self.tags = tagsCaricati
            }
        }
    }
}

//bottoni categorie
struct ButtonsCat: View {
    var Immagine: String
    var Titolo: String
    
    var body: some View {
        Button(action: {
        }) {
            VStack(spacing: 10) {
                Image(systemName: Immagine)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                
                Text(Titolo)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(minWidth: 100, minHeight: 100)
            .background(Color.licorice)
            .cornerRadius(15)
        }
    }
}

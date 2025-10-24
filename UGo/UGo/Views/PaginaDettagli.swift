//
//  PaginaDettagli.swift
//  UGo
//
//  Created by Alice Rossi on 24/10/25.
//

import SwiftUI

struct PaginaDettagli: View {
    let itinerario: Itinerario

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ZStack(alignment: .bottom){
                    if let urlString = itinerario.URL_immagine,
                       let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .cornerRadius(10)
                                 .shadow(radius: 3)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    Image("Logo").resizable().frame(width: 90, height: 90).padding(.top, -280)
                    Text(itinerario.nome).font(.title).bold().padding(.bottom, 40).shadow(radius: 10).foregroundColor(.white)
                }
                

                

                VStack(alignment: .leading, spacing: 5) {
                    HStack{
                        Text("Overview").font(.title)
                        Text(itinerario.tag).padding(5).background(Color.white).cornerRadius(50).foregroundColor(.licorice)
                    }
                    Text("Duration: \(itinerario.durata_ore)")
                    Text("Distance: \(itinerario.distanza_km)")
                    Text("Difficulty: \(itinerario.difficolta)")
                    Text("Region: \(itinerario.regione)")
                }.padding(.bottom, 20)
                
                Text(itinerario.descrizione)
                
                Divider()
                
                VStack{
                    //mettere mappa qui al posto di immagine
                    if let urlString = itinerario.URL_immagine,
                       let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .cornerRadius(10)
                                 .shadow(radius: 3)
                                 .padding(20)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    Text("Tappe").font(.title).padding(.bottom, 20)
                    ForEach(itinerario.tappe_itinerario, id: \.self) { tappa in
                        Text("- \(tappa)")
                    }

                }.background(Color.lightGreen).frame(alignment: .leading)
            }
            .padding(20).foregroundColor(.licorice)
        }
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.milGreen)
    }
}

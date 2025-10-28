//
//  Homepage.swift
//  UGo
//
//  Created by s11 on 17/10/25.
//

import SwiftUI

struct Homepage: View {
    @State private var searchText: String = ""
    @State private var itinerari: [Itinerario] = []
    
    var filteredItinerari: [Itinerario] {
        if searchText.isEmpty{
            return itinerari
        } else {
            return itinerari.filter { itinerario in
                itinerario.nome.lowercased().contains(searchText.lowercased()) ||
                itinerario.regione.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    VStack{
                        Text("Where would you like to go?")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.top, 100)
                        
                        TextField("Search by region or name", text: $searchText).padding(10).background(.white).foregroundColor(.licorice).cornerRadius(40).padding(20)
                    }.background(.licorice).cornerRadius(40).padding(20)
                    
                    Image("Logo").resizable().frame(width: 100, height: 100).padding(.top, -130)
                }
                
                VStack{
                    Text("Categories").font(.title3).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.licorice)
                    
                    ListaTags()
                }.padding(20).background(Color(.white))
                
                Text(searchText.isEmpty ? "Routes of the day" : "Search results")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .foregroundColor(.licorice)
                
                ItinerariCard(itinerari: filteredItinerari)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.milGreen)
                .onAppear{
                    ItinerarioViewModel().fetchItinerari{ itinerariCaricati in
                        self.itinerari = itinerariCaricati
                    }
                }
        }
    }
}

#Preview {
    Homepage()
}

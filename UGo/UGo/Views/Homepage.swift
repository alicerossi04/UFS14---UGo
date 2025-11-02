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
    @State private var selectedTag: String? = nil
    
    var filteredItinerari: [Itinerario] {
        return itinerari.filter { itinerario in
            let tagMatch = selectedTag == nil || itinerario.tag == selectedTag
            let searchMatch = searchText.isEmpty ||
                itinerario.nome.lowercased().contains(searchText.lowercased()) ||
                itinerario.regione.lowercased().contains(searchText.lowercased())
            
            return tagMatch && searchMatch
        }
    }
    
    var body: some View {
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
                    
                    VStack{
                        HStack {
                            Spacer()
                            NavigationLink(destination: UserProfile()) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.licorice)
                            }
                            .padding(.trailing, 20)
                        }
                        Spacer()
                    }
                }
                
                VStack{
                    Text("Categories").font(.title3).frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.licorice)
                    
                    ListaTags(selectedTag: $selectedTag)
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
                }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Homepage()
}

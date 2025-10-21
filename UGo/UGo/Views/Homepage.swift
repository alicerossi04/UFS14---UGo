//
//  Homepage.swift
//  UGo
//
//  Created by s11 on 17/10/25.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    Text("Where would you like to go?")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.top, 100)
                    TextField("Search", text: .constant("")).padding(10).background(.white).cornerRadius(40).padding(20)
                }.background(.licorice).cornerRadius(40).padding(20)
                
                Image("Logo").resizable().frame(width: 100, height: 100).padding(.top, -130)
                
                //da mettere placeholder
                
            }
            
            VStack{
                Text("Categories").font(.title3).frame(maxWidth: .infinity, alignment: .leading)

                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ButtonsTags(Immagine:"mountain.2", Testo: "Mountain")
                        ButtonsTags(Immagine:"figure.walk", Testo: "By foot")
                        ButtonsTags(Immagine:"bicycle", Testo: "By bike")
                        ButtonsTags(Immagine:"figure.and.child.holdinghands", Testo: "for family")
                        //da fare: mettere ciclo foreach per tag
                    }
                }
            }.padding(20).background(Color(.white))
                        
            Text("Routes of the day").font(.title3).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20).padding(.top, 10)
            
            RicettaCardApi()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.milGreen)
    }
}

#Preview {
    Homepage()
}

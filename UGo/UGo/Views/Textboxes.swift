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
            5
        )
        
        if isMandatory && !isValid {
            Text("Inserire un campo valido").foregroundColor(.red).font(.caption)
        }
    }
}

//bottoni custom log in e sign up
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

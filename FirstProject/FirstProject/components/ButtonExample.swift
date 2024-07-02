//
//  ButtonExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 29/06/24.
//

import SwiftUI

struct ButtonExample: View {
    @State var subscribers = 0
    var body: some View {
        Button("Button"){
            print("Hola")
        }
        Button(action: {
               subscribers += 1
               print("Subscriber")
               }) {
                   Text("Subscriber: \(subscribers)")
                       .padding() // Añade padding alrededor del texto para hacer que el botón se ajuste a su contenido
                       .foregroundColor(.white)
                       .background(Color.red)
                       .cornerRadius(10)
                       .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
               }
               
           
    }
}

#Preview {
    ButtonExample()
}

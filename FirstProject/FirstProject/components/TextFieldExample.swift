//
//  TextFieldExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 30/06/24.
//

import SwiftUI

struct TextFieldExample: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField(
                "Email",
                text: $email
            )
            .padding()
            .frame(maxWidth: .infinity) // Extiende el TextField al ancho de la pantalla
            .padding(.horizontal, 1) // Añade padding horizontal para los bordes
            .background() // Fondo blanco para que el borde gris sea visible
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            ) // Agrega un borde gris sutil
            .padding(.horizontal, 50) // Añade padding horizontal externo para separar del borde de la pantalla
            .keyboardType(.emailAddress)
            .onChange(of: email) { oldValue, newValue in
                print("Last value was: \(oldValue)")
                print("New value is: \(newValue)")
            }
            
            SecureField(
                "Password",
                text: $password
            )
            .padding()
            .frame(maxWidth: .infinity) // Extiende el TextField al ancho de la pantalla
            .padding(.horizontal, 1) // Añade padding horizontal para los bordes
//            .background(.gray.opacity(0.1)) // Fondo blanco para que el borde gris sea visible
            .background() // Fondo blanco para que el borde gris sea visible
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
            ) // Agrega un borde gris sutil
            .padding(.horizontal, 50) // Añade padding horizontal externo para separar del borde de la pantalla
            .keyboardType(.emailAddress)
            .onChange(of: email) { oldValue, newValue in
                print("Last value was: \(oldValue)")
                print("New value is: \(newValue)")
            }.padding(.top, 10)
            
            HStack {
                Text(email)
                    .lineLimit(2)
                    .padding(.top, 10)
                Spacer() // Empuja el texto al inicio (izquierda) del HStack
            }
            .padding(.horizontal, 60)

        }.background(.backgroundApp)
    }
            
}

#Preview {
    TextFieldExample()
}

//
//  ImgResult.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 1/07/24.
//

import SwiftUI

struct ImcResult: View {
    
    let weight: Int
    
    let heigth: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("User IMC is:")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Text("\(calculateIMC(weight: weight, heigth: heigth))")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateIMC(
    weight: Int,
    heigth: Double
) -> String {
    //Ejemplo: Peso = 68 kg, Estatura = 165 cm (1.65 m)
    //Cálculo: 68 ÷ (1.65)2 = 24.98
    let heigth = (heigth / 100)
    let result = ((Double(weight))/Double((heigth)*heigth))
    return String(format: "%.1f", result)
}

#Preview {
    ImcResult(weight: 1, heigth: 1)
}

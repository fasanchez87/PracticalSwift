//
//  LabelExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 29/06/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("Label",
              systemImage: "figure.walk")
        .frame(width: 200, height: 100)
        
        Label("Label",
              image: "figure.walk")
        .frame(width: 200, height: 100)
        
        Label(
            title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)},
            icon: { Image(systemName: "figure.walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding(30)
            }
        )
        
    }
}

#Preview {
    LabelExample()
}

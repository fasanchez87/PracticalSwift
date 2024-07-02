//
//  ImageExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 29/06/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("rick")
            .resizable()
            .scaledToFit()
            .frame(
                width: 150
            )
        
        Image(systemName: "figure")
            .resizable()
            .scaledToFit()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)       
        
    }
}

#Preview {
    ImageExample()
}

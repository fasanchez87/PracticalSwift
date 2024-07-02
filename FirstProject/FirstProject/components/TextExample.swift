//
//  TextExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 29/06/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("Hello, Text!").font(.largeTitle)
        Text("Hello, Text!")
            .font(.system(
                size: 40,
                weight: .heavy,
                design: .serif
            )
            )
            .underline()
            .foregroundStyle(.blue)
        Text("text text text text text text text text")
            .frame(width: 100)
            .lineLimit(2)
            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
    
    }
}

#Preview {
    TextExample()
}

//
//  MenuView.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 30/06/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                //First form for navigate
//                NavigationLink {
//                    
//                } label: {
//                    Text("IMC Calculator")
//                }
                
                //Second form for navigate
                NavigationLink(destination: ImcView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperHeroSearcher()) {
                    Text("Super Hero Searcher")
                }
               
                Text("App 2")
                Text("App 3")
                Text("App 4")
                Text("App 5")
               
            }
        }
    }
}

#Preview {
    MenuView()
}

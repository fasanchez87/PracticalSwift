//
//  ListExample.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 1/07/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "One"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Jowee"),
    Pokemon(name: "Jowee"),
    Pokemon(name: "Jowee"),
    Pokemon(name: "Jowee"),
    Pokemon(name: "Jowee"),
    Pokemon(name: "Charizard")
]

var digimons = [
    Digimon(name: "One"),
    Digimon(name: "Two"),
    Digimon(name: "Three"),
    Digimon(name: "Four"),
    Digimon(name: "Five")
]

struct ListExample: View {
    var body: some View {
//        List{
//            ForEach(pokemons, id:\.name){ pokemon in
//                Text(pokemon.name)
//            }
//        }
//        List(digimons){ digimon in
//            Text(digimon.name)
//        }
        
        VStack {
            Section("Pokemons") {
                List{
                    ForEach(pokemons, id:\.name){ pokemon in
                        Text(pokemon.name)
                    }
                }.listStyle(.automatic)
            }
        }
        Section("Digimons") {
            List(digimons){ digimon in
                Text(digimon.name)
            }
        }
        
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}

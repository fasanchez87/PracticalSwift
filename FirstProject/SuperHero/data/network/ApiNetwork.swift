//
//  ApiNetwork.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 1/07/24.
//

import Foundation

class ApiNetwork {
    
    func getHerosByQuery(query: String) async throws -> Wrapper {
        
        let url = URL(string: "https://superheroapi.com/api/aae587f73ce5f02c4bf5cb44cab2b136/search/batman")
        
        //URL Session same retrofit
        let (data, _) = try await URLSession.shared.data(from: url!)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
    
    struct Wrapper: Codable {
        let response: String
        let results: [SuperHero]
    }
    
    struct SuperHero: Codable, Identifiable {
        let id: String        
        let name: String
    }
}

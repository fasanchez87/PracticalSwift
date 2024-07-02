//
//  ApiService.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 2/07/24.
//

import Foundation

protocol ApiServiceProtocol {
    func getHerosByQuery(query: String) async throws -> ApiResponse
}

class ApiService: ApiServiceProtocol {
    
    func getHerosByQuery(query: String) async throws -> ApiResponse {
       // Ajusta la URL según sea necesario
       guard let url = URL(string: "https://superheroapi.com/api/aae587f73ce5f02c4bf5cb44cab2b136/search/\(query)") else {
           throw URLError(.badURL)
       }
       
       let (data, _) = try await URLSession.shared.data(from: url)
        
       let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
       
       return apiResponse
    }
}

struct ApiResponse: Decodable {
    let response: String
    let results: [Hero]?
}

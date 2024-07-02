//
//  HeroRepositoryImpl.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 2/07/24.
//

import Foundation

class HeroRepositoryImpl: HeroRepository {
    
    private let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchHeroes(query: String) async throws -> [Hero] {
        let response = try await apiService.getHerosByQuery(query: query)
        return response.results ?? []
    }
}

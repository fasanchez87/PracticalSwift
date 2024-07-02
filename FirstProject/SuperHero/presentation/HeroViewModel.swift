//
//  HeroViewModel.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 2/07/24.
//

import Foundation

class HeroViewModel: ObservableObject {
    
    @Published var list: [Hero] = []
    
    @Published var isLoading: Bool = false
    
    @Published var hasSearched: Bool = false
    
    private let repository: HeroRepository
    
    init(repository: HeroRepository) {
        self.repository = repository
    }
     
    func fetchHeroes(query: String) {
        hasSearched = true
        isLoading = true
        Task {
            do {
                let heroes = try await repository.fetchHeroes(query: query)
                DispatchQueue.main.async {
                    self.list = heroes
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print("Error fetching data: \(error)")
            }
        }
    }
}

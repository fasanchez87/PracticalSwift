//
//  HeroRepository.swift
//  FirstProject
//
//  Created by Fabio Sánchez on 2/07/24.
//

import Foundation

protocol HeroRepository {
    
    func fetchHeroes(query: String) async throws -> [Hero]
}

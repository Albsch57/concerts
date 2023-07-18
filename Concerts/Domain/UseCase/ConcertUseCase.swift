//
//  ConcertUseCase.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

final class ConcertUseCase: UseCase {
    
    private let repository: ConcertRepository
    
    init(repository: ConcertRepository) {
        self.repository = repository
    }
    
    func fetchConcerts(genre: GenreType = .all) -> [Concert] {
        
        let request = Concert.fetchRequest()
        
        let count = try? viewContext.count(for: request) ?? 0
        if count == 0 {
            repository.makeFakeConcerts()
        }
        

        return repository.fetchConcerts(genre: genre)
    }
    
}


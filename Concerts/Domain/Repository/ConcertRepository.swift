//
//  ConcertRepository.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

protocol ConcertRepository {
    func fetchConcerts(genre: GenreType) -> [Concert]
    func fetchConcerts(for user: User) -> [Concert]
    func makeFakeConcerts()
}

#warning("Нужно реализваоть через accesTocker или User")
extension ConcertRepository where Self == ConcertCoreDataRepositoryImpl {
    static var coreData: Self { Self() }
}

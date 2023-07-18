//
//  SavedViwModel.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 26.06.2023.
//

import Foundation
import UIKit

final class SavedViewModel {
    
    private let useCase = ConcertUseCase(repository: .coreData)
    private lazy var userUseCase = UserUseCase()
    
    func fetchConcerts() -> [Concert] {
        UserUseCase.currentUser!.favoriteConcerts
    }
    
    func updateFavoriteConcertsOfCurrentUser(_ concert: Concert) {
        UserUseCase.updateSavedConcertIfNeeded(concert: concert)
    }
    
    func buyTicket(for concert: Concert) {
        userUseCase.buyTicket(concert)
    }
}

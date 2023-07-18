//
//  TicketViewModel.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 27.06.2023.
//

import Foundation

final class TicketViewModel {
    
    private let useCase = ConcertUseCase(repository: .coreData)
    
    func fetchConcerts() -> [Ticket] {
        UserUseCase.currentUser!.paidTickets
    }
    
    
    
}

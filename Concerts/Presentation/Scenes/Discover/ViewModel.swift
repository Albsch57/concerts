//
//  ViewModel.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation
import UIKit

final class DiscoverViewModel {
    
    typealias Item = (DiscoverSection, [DiscoverItem])
    
    private let useCase = ConcertUseCase(repository: .coreData)
    private lazy var userUseCase = UserUseCase()
    
    func fetchItems(genre: GenreType = .all) -> [Item] {

        
        let concerts = useCase.fetchConcerts(genre: genre)
        
        var result: [Item] = [
            (.genre, GenreType.allCases.map({ DiscoverItem(genre: $0) }))
        ]
       
        if genre == .all {
            result.append((DiscoverSection.coming, [
                .init(commingItem: .init(image: .init(named: "coming1")!)),
                .init(commingItem: .init(image: .init(named: "coming2")!))
            ]))
        }
        
       
        let popularConcerts = concerts.filter({ $0.isPopular }).map({ DiscoverItem(concert: $0) })
        
        let recommendedConcert = concerts.filter { $0.recommended }.map {
            DiscoverItem(concert: $0) // return
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        let dateCompontents = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: currentDate)
        
        let thisWeek = calendar.date(from: dateCompontents)!
        let nextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: thisWeek)!
        
        let nextWeekConcerts = concerts.filter {
            calendar.isDate($0.date, equalTo: nextWeek, toGranularity: .weekOfYear)
        }.map({ DiscoverItem(concert: $0) })
        
        if !popularConcerts.isEmpty {
            result.append((DiscoverSection.popular, popularConcerts)) // Concert
        }
        
        if !nextWeekConcerts.isEmpty {
            result.append((DiscoverSection.nextWeek, nextWeekConcerts)) // Concert
        }
        
        if !recommendedConcert.isEmpty {
            result.append((DiscoverSection.recommended, recommendedConcert))
        }
        
        return result
        
    }
    
    func updateFavoriteConcertsOfCurrentUser(_ concert: Concert) {
        UserUseCase.updateSavedConcertIfNeeded(concert: concert)
    }
    
    func buyTicket(for concert: Concert) {
        userUseCase.buyTicket(concert)
    }
    
}

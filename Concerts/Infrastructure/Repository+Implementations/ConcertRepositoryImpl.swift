//
//  ConcertRepositoryImpl.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

final class ConcertCoreDataRepositoryImpl: ConcertRepository, UseCase {
    
    func fetchConcerts(genre: GenreType = .all) -> [Concert] {
        
        let request = Concert.fetchRequest()
        
        if genre != .all {
            request.predicate = NSPredicate(format: "genre LIKE[c] %@", genre.rawValue)
        }
        
        let concerts = try? viewContext.fetch(request)
        return concerts ?? []
    }
    
    func fetchConcerts(for user: User) -> [Concert] {
        []
    }
    
    func makeFakeConcerts() {
        
        let fakeData = loadJSON()
        for item in fakeData {
            let concert = Concert(context: viewContext)
            let songer = Songer(context: viewContext)
            let ticket = Ticket(context: viewContext)
            
            concert.uuid = UUID()
            concert.coverPath = item.coverPath
            concert.date = item.date
            concert.genre = item.genre
            concert.location = item.location
            concert.offer = item.offer
            songer.name = item.songer.name
            concert.songer = songer
            concert.isPopular = item.isPopular
            concert.recommended = item.recommended
            
   
            ticket.price = Double(item.priceTicket) ?? 5.0
            ticket.row = Int16.random(in: 1..<15)
            ticket.seat = Int16.random(in: 1..<30)
            concert.ticket = ticket
            
        }
        
    }
    
    fileprivate func loadJSON() -> [ConcertJsonItem] {
        
        if let url = Bundle.main.url(forResource: "Concert", withExtension: "json")  {
            do {
                let data = try Data(contentsOf: url)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let jsonData = try decoder.decode([ConcertJsonItem].self, from: data)
                return jsonData
            } catch {
                print(error)
            }
        }
        
        return []
    }
}

// temporary model
fileprivate struct ConcertJsonItem: Decodable {
    var coverPath: String
    var date: Date
    var genre: String
    var location: String
    var offer: String
    var isPopular: Bool
    var recommended: Bool
    var priceTicket: String
    var songer: SongerJsonItem
    
    
    // temprary model
    struct SongerJsonItem : Decodable {
        let name: String
    }
}

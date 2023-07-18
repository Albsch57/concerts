//
//  UserUseCase.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import CoreData
import UIKit

enum UserError: Error {
    case wrongPasswordOrEmail, coreData(String), emailIsBusy
    
    var textDescription: String {
        switch self {
        case .wrongPasswordOrEmail:
            return "Error password or email"
        case .coreData(_):
            return "Something wrong"
        case .emailIsBusy:
            return "Email is busy"
        }
    }
}

// Bussiness logic
final class UserUseCase: UseCase {
    
    static var currentUser: User?
    
    static func updateSavedConcertIfNeeded(concert: Concert) {
        guard let currentUser else { return }
        if currentUser.favoriteConcerts.contains(concert) {
            concert.savedUser = nil
        } else {
            concert.savedUser = currentUser
        }
    }
    
        
        

    
    func makeUser(email: String, password: String) -> Result<User, UserError> {
        guard checkEmailIsBusy(email) else { return .failure(.emailIsBusy) }
        
        let user = User(context: viewContext)
        user.email = email
        user.password = password
        
        do {
            try viewContext.saveIfNeeded()
            return .success(user)
        } catch {
            return .failure(.coreData(error.localizedDescription))
        }
    }
    
    func fetchSavedConcerts(for user: User) -> [Concert] {
        let concerts = user.savedConcerts?.allObjects as? [Concert]
        return concerts ?? []
    }
    
    func auth(email: String, password: String) -> Result<User, UserError> {
        let request = User.fetchRequest()
        request.predicate = .init(format: "email == %@ && password == %@", email, password)
        request.fetchLimit = 1
        
        if let user = try? viewContext.fetch(request).first {
            UserUseCase.currentUser = user
            return .success(user)
        }
        
        return .failure(.wrongPasswordOrEmail)
    }
    
    #warning("Вынести в отдельный сервис")
    static func authenticatedUserBy(email: String) {
        let request = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email)
        request.fetchLimit = 1
        
        let viewContext = (UIApplication.shared.delegate as! AppDelegate).viewContext
        Self.currentUser = try? viewContext.fetch(request).first
    }
    
    
    func buyTicket(_ concert: Concert) {
        concert.ticket.user = currentUser
    }
    
    func fetchTickets(for user: User) -> [Ticket] {
        let tickets = user.tickets?.allObjects as? [Ticket]
        return tickets ?? []
    }
    
    private func checkEmailIsBusy(_ email: String) -> Bool {
        let request = User.fetchRequest()
        request.predicate = .init(format: "email == %@", email)
        request.fetchLimit = 1
        
        if let _ = try? viewContext.fetch(request).first {
            return false
        }
        
        return true
    }
    
}

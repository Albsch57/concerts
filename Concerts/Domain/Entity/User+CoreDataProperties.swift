//
//  User+CoreDataProperties.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var surname: String?
    @NSManaged public var username: String?
    @NSManaged public var savedConcerts: NSSet?
    @NSManaged public var tickets: NSSet?

}

extension User : Identifiable {

}

extension User {
    var favoriteConcerts: [Concert] {
        savedConcerts?.allObjects as? [Concert] ?? []
    }
    
    var paidTickets: [Ticket] {
        tickets?.allObjects as? [Ticket] ?? []
    }
}

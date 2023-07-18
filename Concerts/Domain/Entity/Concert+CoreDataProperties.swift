//
//  Concert+CoreDataProperties.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//
//

import Foundation
import CoreData


extension Concert {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Concert> {
        return NSFetchRequest<Concert>(entityName: "Concert")
    }

    @NSManaged public var uuid: UUID
    @NSManaged public var coverPath: String
    @NSManaged public var date: Date
    @NSManaged public var genre: String
    @NSManaged public var location: String
    @NSManaged public var offer: String
    @NSManaged public var savedUser: User?
    @NSManaged public var songer: Songer
    @NSManaged public var ticket: Ticket
    
    @NSManaged public var isPopular: Bool
    @NSManaged public var recommended: Bool

}

extension Concert : Identifiable {

}

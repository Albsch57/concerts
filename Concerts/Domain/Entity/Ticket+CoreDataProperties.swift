//
//  Ticket+CoreDataProperties.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var row: Int16
    @NSManaged public var seat: Int16
    @NSManaged public var user: User?
    @NSManaged public var concert: Concert
    
    @NSManaged public var price: Double

}

extension Ticket : Identifiable {

}

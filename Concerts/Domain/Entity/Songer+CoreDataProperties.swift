//
//  Songer+CoreDataProperties.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//
//

import Foundation
import CoreData


extension Songer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Songer> {
        return NSFetchRequest<Songer>(entityName: "Songer")
    }

    @NSManaged public var name: String?
    @NSManaged public var concerts: NSSet?

}

// MARK: Generated accessors for concerts
extension Songer {

    @objc(addConcertsObject:)
    @NSManaged public func addToConcerts(_ value: Concert)

    @objc(removeConcertsObject:)
    @NSManaged public func removeFromConcerts(_ value: Concert)

    @objc(addConcerts:)
    @NSManaged public func addToConcerts(_ values: NSSet)

    @objc(removeConcerts:)
    @NSManaged public func removeFromConcerts(_ values: NSSet)

}

extension Songer : Identifiable {

}

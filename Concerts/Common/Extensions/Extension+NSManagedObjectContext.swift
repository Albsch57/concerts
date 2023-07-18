//
//  Extension+NSManagedObjectContext.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import CoreData

extension NSManagedObjectContext {
    func saveIfNeeded() throws {
        if hasChanges {
            try save()
        }
    }
}

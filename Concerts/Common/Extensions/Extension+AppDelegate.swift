//
//  Extension+AppDelegate.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import CoreData

extension AppDelegate {
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}

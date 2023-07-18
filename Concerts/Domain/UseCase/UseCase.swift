//
//  UseCase.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import CoreData
import UIKit

protocol UseCase {
    var viewContext: NSManagedObjectContext { get }
    var currentUser: User { get }
}

extension UseCase {
    var viewContext: NSManagedObjectContext {
        (UIApplication.shared.delegate as! AppDelegate).viewContext
    }
    
    var currentUser: User {
        UserUseCase.currentUser!
    }
}

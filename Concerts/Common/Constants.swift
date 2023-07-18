//
//  Constants.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

enum GenreType: String, Hashable, CaseIterable {
    case all = "all", electro, heavy, jazz
    
    var imagePath: String {
        switch self {
        case .all:
            return "filter1"
        case .electro:
            return "filter2"
        case .heavy:
            return "filter3"
        case .jazz:
            return "filter4"
        }
    }
    
}

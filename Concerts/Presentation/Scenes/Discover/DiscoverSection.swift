//
//  DiscoverSection.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

enum DiscoverSection: Int, Hashable {
    case genre = 0, coming, popular, nextWeek, recommended
    
    var title: String? {
        switch self {
        case .coming: return "What’s coming to Barcelona"
        case .popular: return "Popular"
        case .nextWeek: return "Next week"
        case .recommended: return "Recommended for you"
        default: return nil
        }
    }
}

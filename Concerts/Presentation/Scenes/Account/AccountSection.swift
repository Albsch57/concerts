//
//  AccountSection.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 29.06.2023.
//

import Foundation

enum AccountSection: Hashable {
    case profile, settings
    
    var title: String? {
        switch self {
        case .profile: return "PROFILE"
        case .settings: return "SETTINGS"
        }
    }
}

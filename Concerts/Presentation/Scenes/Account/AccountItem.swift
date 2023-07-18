//
//  AccountItem.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 29.06.2023.
//

import Foundation

enum AccountItem: Hashable {
    case textField(TextField), appearance, logout
    
    enum TextField: Hashable {
        case username, name, lastname, email, address
        
        var title: String? {
            switch self {
            case .username: return "User name"
            case .name: return "Name"
            case .lastname: return "Last name"
            case .email: return "Email"
            case .address: return "Address"
            }
        }
    }
    
    
}

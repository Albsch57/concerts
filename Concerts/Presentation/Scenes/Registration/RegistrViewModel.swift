//
//  ViewModel.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import Foundation

final class RegisterViewModel {
    
    private let useCase = UserUseCase()
    
    func loginUser(email: String, password: String) -> Result<User, UserError> {
        useCase.auth(email: email, password: password)
    }
    
    func registerUser(email: String, password: String) -> Result<User, UserError>{
        useCase.makeUser(email: email, password: password)
    }
}

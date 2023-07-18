//
//  SongerRepository.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import Foundation

protocol SongerRepository {
    func makeSonger(name: String) -> Songer
    func fetchSongers() -> [Songer]
}

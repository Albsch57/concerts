//
//  DiscoverItem.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import UIKit

struct DiscoverItem: Hashable {
    let uuid = UUID()
    let genre: GenreType?
    let commingItem: CommingItem?
    let concert: Concert?

    init(genre: GenreType? = nil, commingItem: CommingItem? = nil, concert: Concert? = nil) {
        self.genre = genre
        self.commingItem = commingItem
        self.concert = concert
    }
}

struct CommingItem: Hashable {
    let image: UIImage
    
    
}

//
//  TicketCollectionViewCell.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 27.06.2023.
//

import UIKit

class TicketCollectionViewCell: UICollectionViewCell {
    static let reuseId = "cellTicketSave"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        title.textColor = .white
        title.numberOfLines = 0
        return title
    }()
    
    private let dateLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        date.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        return date
    }()
    
    private let discription: UILabel = {
        let discription = UILabel()
        discription.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        discription.textColor = .gray
        discription.numberOfLines = 0
        
        return discription
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, title: String, date: Date, description: String) {
        self.image.image = image
        self.title.text = title
        dateLabel.text = date.formatted()
        discription.text = description
    }
    

}

extension TicketCollectionViewCell {
    private func makeLayout() {
        
        contentView.addSubview(discription)
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(dateLabel)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        discription.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 80),
            //            image.heightAnchor.constraint(equalToConstant: 50),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            //            image.heightAnchor.constraint(equalToConstant: 120),
            
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            discription.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2),
            discription.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            discription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            // discription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
}

//
//  ScanCollectionViewCell.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 27.06.2023.
//

import UIKit

class ScanCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "cellTicketScan"
    
    private let imageScan: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = .init(named: "scan")
        return image
    }()
    
    private let titleRow: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .regular)
   //     title.textColor = .yellow
        title.text = "Row"
        title.numberOfLines = 0
        return title
    }()
    
    private let dateLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        date.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        return date
    }()
    
    private let timeLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        date.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        
        
        return date
    }()
    
    private let titleSeats: UILabel = {
        let discription = UILabel()
        discription.font = UIFont.systemFont(ofSize: 16, weight: .regular)
 //       discription.textColor = .gray
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
    
    func configure(image: UIImage, row: String, date: Date, time: Date, seats: String) {
        imageScan.image = image
        titleRow.text = row
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        dateLabel.text = "Date: " + dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        timeLabel.text = "Time: " + timeFormatter.string(from: time)

 //       timeLabel.text = "Time: " + time.formatted()
        titleSeats.text = seats
    }
}

extension ScanCollectionViewCell {
    
    private func makeLayout() {
        contentView.addSubview(imageScan)
        contentView.addSubview(titleRow)
        contentView.addSubview(dateLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(titleSeats)
        
        imageScan.translatesAutoresizingMaskIntoConstraints = false
        titleRow.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        titleSeats.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 32),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleRow.topAnchor.constraint(equalTo: dateLabel.lastBaselineAnchor, constant: 21),
            titleRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleSeats.topAnchor.constraint(equalTo: titleRow.topAnchor),

            titleSeats.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            
            imageScan.topAnchor.constraint(equalTo: titleSeats.lastBaselineAnchor, constant: 25),
            imageScan.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageScan.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            imageScan.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
            
          
        ])
        
    }
}

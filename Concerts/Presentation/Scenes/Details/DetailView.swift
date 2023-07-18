//
//  DetailView.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 26.06.2023.
//

import UIKit

class DetailView: UIView {
    
    let favoriteButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = .init(systemName: "heart")
        configuration.preferredSymbolConfigurationForImage = .init(pointSize: 16, weight: .semibold)
        configuration.imageColorTransformer = .init({ _ in
            return .systemRed
        })
        return UIButton(configuration: configuration)
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //    label.text = "Arctic Monkeys"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let titleTown: UILabel = {
        let label = UILabel()
        // label.text = "Parc del Forum, Barcelona"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    let dateLabel: UILabel = {
        var date = UILabel()
        date.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        date.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        return date
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let imageFont: UIImageView = {
        var image = UIImageView(image: UIImage(named: "imageFont"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imageArctic: UIImageView = {
        var image = UIImageView(image: UIImage(named: "popular1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var ticketPrice: Double = 0 {
        didSet {
            print("Устанавливаем \(ticketPrice)")
            button.configuration?.title = "Buy Tickets (\(ticketPrice) €)"
        }
    }
    
    let button: UIButton = {
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .systemRed
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .large
        configuration.contentInsets = .init(top: 16, leading: 0, bottom: 16, trailing: 0)
        
        let button = UIButton(configuration: configuration)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

extension DetailView {
    func makeLayout() {
        let container = UIView()
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView(frame: frame)
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            return scrollView
        }()
        
        backgroundColor = .systemGroupedBackground
        
        addSubview(scrollView)
        scrollView.addSubview(container)
        addSubview(favoriteButton)
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(imageFont)
        imageFont.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        imageFont.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        imageFont.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        //  imageFont.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -8).isActive = true
        
        container.addSubview(imageArctic)
        imageArctic.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 77).isActive = true
        imageArctic.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -77).isActive = true
        imageArctic.topAnchor.constraint(equalTo: container.topAnchor, constant: 127).isActive = true
        imageArctic.heightAnchor.constraint(equalToConstant: 330).isActive = true
        
        container.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleTown)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.topAnchor.constraint(equalTo: imageArctic.bottomAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        container.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16).isActive = true
        button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16).isActive = true
        button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: scrollView.topAnchor), // !!
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // !!!!
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), // !!,
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}


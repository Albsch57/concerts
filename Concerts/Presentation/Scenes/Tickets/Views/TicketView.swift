//
//  TicketView.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 27.06.2023.
//

import UIKit

class TicketView: UIView {
    
    var dataSource: TicketViewController.DataSource! = nil

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    let titleTicket: UILabel = {
        let title = UILabel()
        title.text = "Once you buy a concert ticket simply scan the barcode to acces to your concert."
        title.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.frame = bounds
        makeLayoutDescription()
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    func makeLayout(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: titleTicket.lastBaselineAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    func makeLayoutDescription() {
        addSubview(titleTicket)
        titleTicket.translatesAutoresizingMaskIntoConstraints = false
        titleTicket.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleTicket.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        titleTicket.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
    
    func makeCollectionLayout() -> UICollectionViewCompositionalLayout {
        
//        var configuration  = UICollectionViewCompositionalLayoutConfiguration()
//        configuration.scrollDirection = .vertical
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(16)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return .init(section: section)
        
        
    }
    
    

}

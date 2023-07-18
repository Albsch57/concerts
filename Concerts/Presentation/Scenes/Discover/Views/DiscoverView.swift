//
//  DiscoverView.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import UIKit

class DiscoverView: UIView {
    
    var dataSource: DiscoverViewController.DataSource! = nil
    
    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider  = {  [weak dataSource] numberSection, _ in
            
            guard let section = dataSource?.sectionIdentifier(for: numberSection) else {
                fatalError("Запрашиваемоей секции не существует!")
            }
            
            if section == .genre {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(125), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56)), subitems: [item])
                group.interItemSpacing = .fixed(8)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                return section
            }
            
            else if section == .coming {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(170)), subitem: item, count: 1)
                let section =  NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 16
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                // Section header view layout
                let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)), elementKind: HeaderForConcertSectionView.reuseID, alignment: .top)
                
                // Initialization supplementary section view
                section.boundarySupplementaryItems = [headerView]
                
                return section
            }
            
            else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(141), heightDimension: .estimated(262)), subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                // Section header view layout
                let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)), elementKind: HeaderForConcertSectionView.reuseID, alignment: .top)
                
                // Initialization supplementary section view
                section.boundarySupplementaryItems = [headerView]
                return section
            }
        }
     
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        
        return .init(sectionProvider: sectionProvider, configuration: configuration)
    }

}

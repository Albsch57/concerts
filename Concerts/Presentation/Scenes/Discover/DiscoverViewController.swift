//
//  ViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 19.06.2023.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<DiscoverSection, DiscoverItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<DiscoverSection, DiscoverItem>
    
    private let viewModel = DiscoverViewModel()
    private lazy var dataSource = makeDataSource()
    
    var discoverView: DiscoverView {
        view as! DiscoverView
    }
    
    override func loadView() {
        view = DiscoverView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        discoverView.dataSource = dataSource
        makeSnapshot()
       // discoverView.collectionView.backgroundColor = .yellow
        discoverView.collectionView.setCollectionViewLayout(discoverView.makeLayout(), animated: true)
        discoverView.collectionView.delegate = self
    }

    private func updateSnapshot(using genre: GenreType) {
        let items = viewModel.fetchItems(genre: genre)
        
        var snapshot = Snapshot()
        
        for (section, items) in items {
            snapshot.appendSections([section])
            snapshot.appendItems(items, toSection: section)
        }
        
        dataSource.apply(snapshot)
    }

}


extension DiscoverViewController {
    
    private func makeSnapshot() {
        let items = viewModel.fetchItems()
        var snapshot = Snapshot()
        for (section, items) in items {
            snapshot.appendSections([section])
            snapshot.appendItems(items, toSection: section)
        }
        
        dataSource.apply(snapshot)
    }
    private func makeDataSource() -> DataSource {
        
        let baseCellRegistration = UICollectionView.CellRegistration<ConcertImageCollectionViewCell, DiscoverItem>{ cell, indexPath, item in
            
            if let genre = item.genre {
                cell.configure(image: .init(named: genre.imagePath), title: genre.rawValue.capitalized)
            }
            
            else if let comming = item.commingItem {
                cell.configure(image: comming.image)
            }
            
            
        }
        
        let concertRegistration = UICollectionView.CellRegistration<ConcertItemCollectionViewCell, DiscoverItem> { cell, indexPath, item in
            guard let concert = item.concert else { return }
            let image = UIImage(named: concert.coverPath)!
            
            cell.configure(image: image, title: concert.songer.name ?? "", description: concert.location, date: concert.date)
        }
        
        let headerSectionRegistration = UICollectionView.SupplementaryRegistration<HeaderForConcertSectionView>(elementKind: HeaderForConcertSectionView.reuseID) { [weak self] supplementaryView, elementKind, indexPath in
            
            guard let section = self?.dataSource.sectionIdentifier(for: indexPath.section) else {  return }
            supplementaryView.configure(title: section.title)
        }
        
        let dataSource = DataSource(collectionView: discoverView.collectionView) { collectionView, indexPath, item in
            
            if item.concert != nil {
                return collectionView.dequeueConfiguredReusableCell(using: concertRegistration, for: indexPath, item: item)
            }

            return collectionView.dequeueConfiguredReusableCell(using: baseCellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { collectionView, reuseID, indexPath in
            collectionView.dequeueConfiguredReusableSupplementary(using: headerSectionRegistration, for: indexPath)
        }
        
        
        return dataSource
    }
    
}


extension DiscoverViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        
        if let genre = item.genre {
            updateSnapshot(using: genre)
        }
        
        else if let comming = item.commingItem {
            
        }
        
        // Concert
        else if let concert = item.concert {
            let detailController = DetailViewController()
            detailController.concert = concert
            detailController.delegate = self
            navigationController?.present(detailController, animated: true)
        }
        
    }
}

extension DiscoverViewController: DetailViewDelegate {
    func favoriteButtonIsTapped(_ concert: Concert) {
        viewModel.updateFavoriteConcertsOfCurrentUser(concert)
    }
    
    func buyButtonTicketIsTapped(_ concert: Concert) {
        viewModel.buyTicket(for: concert)
        
        // MARK: SNAPSHOT
//        let paidTickets = UserUseCase.currentUser?.paidTickets ?? []
//
//        var items = [Int: [TicketItem]]()
//        for (index, ticket) in paidTickets.enumerated() {
//            items[index] = [
//                .init(concert: ticket.concert, ticket: nil), // Concert
//                .init(concert: nil, ticket: ticket) // Ticket
//            ]
//        }
//
//        var snapshot = Snapshot()
//        for (sectionIndex, tickets) in items {
//            snapshot.appendSections(sectionIndex)
//            snapshot.appendItems(tickets, toSection: section)
//        }
//
//
//        // MARK: Data source
//        let dataSource = UICollectionViewDiffableDataSource<Int, TicketItem>(collectionView: collectionView) { collectionView, indexPath, ticketItem in
//
//            if let concert = ticketItem.concert {
//                // Ячейка концерта
//                //  return collectionView.dequeueConfiguredReusableCell(using: ticketCellRegistration, for: indexPath, item: ticket)
//            } else if let ticket = ticketItem.ticket {
//                // Ячейка биллета с QR кодом
//                //   return collectionView.dequeueConfiguredReusableCell(using: ticketCellRegistration, for: indexPath, item: ticket)
//            }
//
//        }
    }
    
}

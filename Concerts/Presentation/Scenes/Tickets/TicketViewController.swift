//
//  TicketViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 27.06.2023.
//

import UIKit

class TicketViewController: UIViewController {

    typealias DataSource = UICollectionViewDiffableDataSource<Int, TicketItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, TicketItem>
    
    private let viewModel = TicketViewModel()
    private lazy var dataSource = makeDataSource()
    
    var ticketView: TicketView {
        view as! TicketView
    }
    
    override func loadView() {
        view = TicketView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketView.dataSource = dataSource
        
        ticketView.collectionView.setCollectionViewLayout(ticketView.makeCollectionLayout(), animated: true)
       
        navigationItem.title = "Your tickets"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSnapsot()
    }
    
    
    

}

extension TicketViewController {
    private func makeDataSource() -> DataSource {
        #warning("Спросить почему опц")
        let ticketCellRegistration = UICollectionView.CellRegistration<TicketCollectionViewCell, TicketItem> { cell, indexPath, concert in
            guard let concert = concert.concert else { return }
            let image = UIImage(named: concert.coverPath)!
            
            cell.configure(image: image, title: concert.songer.name ?? "Unknown songer", date: concert.date, description: concert.location)
        }
        
        let scanCellRegistration = UICollectionView.CellRegistration<ScanCollectionViewCell, TicketItem> { cell, indexPath, ticket in
            guard let ticket = ticket.ticket else { return }
         //   let image = UIImage(named: ticket.)!
            
            
            cell.configure(image: .init(named: "scan")!, row: "Row: \(String(ticket.row))" , date: ticket.concert.date, time: ticket.concert.date, seats: "Seats: \(String(ticket.seat))")
            
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Int, TicketItem>(collectionView: ticketView.collectionView) { collectionView, indexPath, ticketItem in
            
            if let concert = ticketItem.concert {
                // Ячейка концерта
                return collectionView.dequeueConfiguredReusableCell(using: ticketCellRegistration, for: indexPath, item: ticketItem)
            } else if let ticket = ticketItem.ticket {
                // Ячейка биллета с QR кодом
                return collectionView.dequeueConfiguredReusableCell(using: scanCellRegistration, for: indexPath, item: ticketItem)
            }
            return nil
        }
        return dataSource
    }
    
    private func updateSnapsot() {
        let paidTickets = viewModel.fetchConcerts()
//        let paidTickets = UserUseCase.currentUser?.paidTickets ?? []
        
        var items = [Int: [TicketItem]]()
        for (index, ticket) in paidTickets.enumerated() {
            items[index] = [
                .init(concert: ticket.concert, ticket: nil), // Concert
                .init(concert: nil, ticket: ticket) // Ticket
            ]
        }
        
        var snapshot = Snapshot()
        for (sectionIndex, tickets) in items {
            snapshot.appendSections([sectionIndex])
            snapshot.appendItems(tickets, toSection: sectionIndex)
        }
        
        dataSource.apply(snapshot)
    }
}

//
//  DetailViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 26.06.2023.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func favoriteButtonIsTapped(_ concert: Concert)
    func buyButtonTicketIsTapped(_ concert: Concert)
}


class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    weak var delegate: DetailViewDelegate?
    
    var concert: Concert! = nil {
        didSet {
            updateDataOfConcert()
        }
    }
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard concert != nil else {
            fatalError("Concert is empty")
        }
        detailView.button.addTarget(self, action: #selector(buyTicket), for: .touchUpInside)
        detailView.favoriteButton.addTarget(self, action: #selector(markIsFavorite), for: .touchUpInside)
    }
    
    @objc
    private func markIsFavorite() {
        
        // Update users saved concerts
        delegate?.favoriteButtonIsTapped(concert)
        
        
        // Get actual state of concerts
        let image = concert.savedUser == nil ? UIImage(systemName: "heart") : UIImage(systemName: "heart.fill")
        detailView.favoriteButton.configuration?.image = image
    }
    
    @objc
    private func buyTicket() {
        delegate?.buyButtonTicketIsTapped(concert)
        dismiss(animated: true)
    }
    
    private func updateDataOfConcert() {
        detailView.titleLabel.text = concert.songer.name
        detailView.descriptionLabel.text = concert.offer
        detailView.titleTown.text = concert.location
        detailView.dateLabel.text = DateFormatter.localizedString(from: concert.date, dateStyle: .medium, timeStyle: .none)
        detailView.imageArctic.image = .init(named: concert.coverPath)
        detailView.ticketPrice = concert.ticket.price
        
        detailView.favoriteButton.configuration?.image = concert.savedUser == nil ? UIImage(systemName: "heart") : UIImage(systemName: "heart.fill")
        
        if UserUseCase.currentUser!.paidTickets.contains(concert.ticket) {
            detailView.button.isHidden = true
        }
    }
}




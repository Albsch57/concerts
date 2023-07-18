//
//  SavedViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 26.06.2023.
//

import UIKit

class SavedViewController: UIViewController {
    
    typealias DataSource = UITableViewDiffableDataSource<Int, Concert>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Concert>
    
    private let viewModel = SavedViewModel()
    private var dataSource: DataSource! = nil
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.reuseId)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Saved Concerts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.rowHeight = 136
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray2

        configureNavigationButtons()
        makeLayout()
        makeDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSnapshot()
    }
    

    @objc
    private func showEdit() {
        print("Edit")
    }
    

}

extension SavedViewController {
    private func makeLayout() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        view.backgroundColor = .systemGroupedBackground
    }
    
    private func configureNavigationButtons() {
        let editButton = UIBarButtonItem(systemItem: .edit)
        editButton.target = self
        editButton.action = #selector(showEdit)
        editButton.tintColor = .systemRed
        navigationItem.rightBarButtonItem = editButton
    }
}

extension SavedViewController {
    private func makeDataSource() {
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, concert in
            let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.reuseId, for: indexPath) as! SavedTableViewCell
            
            cell.configure(image: UIImage(named: concert.coverPath)!, title: concert.songer.name ?? "Unknown songer", date: concert.date, description: concert.location)
            
            cell.accessoryType = .disclosureIndicator
            return cell
        })
    }
    
    private func updateSnapshot() {
        let concerts = viewModel.fetchConcerts()
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(concerts, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let concert = dataSource.itemIdentifier(for: indexPath) else { return }
        
        let detailController = DetailViewController()
        detailController.concert = concert
        detailController.delegate = self
        navigationController?.present(detailController, animated: true)
    }
}

extension SavedViewController: DetailViewDelegate {
    
    func favoriteButtonIsTapped(_ concert: Concert) {
        viewModel.updateFavoriteConcertsOfCurrentUser(concert)
        
        var snapshot = dataSource.snapshot()
        
        if snapshot.indexOfItem(concert) == nil {
            snapshot.appendItems([concert])
        }  else {
            snapshot.deleteItems([concert])
        }
        
        dataSource.apply(snapshot)
        
    }
    
    func buyButtonTicketIsTapped(_ concert: Concert) {
        viewModel.buyTicket(for: concert)
        
    }
    
    
}

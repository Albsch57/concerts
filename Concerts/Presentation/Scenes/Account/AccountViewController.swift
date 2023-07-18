//
//  AccountViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 29.06.2023.
//

import UIKit

class AccountViewController: UIViewController {
    
    private var itemsInSections: Array<Array<AccountItem>> = [
        [.textField(.username), .textField(.name), .textField(.lastname), .textField(.email), .textField(.address)],
        [.appearance, .logout]
    ]
    
    typealias Section = AccountSection
    
    private var sections: Array<Section> = [.profile, .settings]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.reuseId)
        return tableView
    }()
    
    private var segmentedControl: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My account"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contentCell")
        view.backgroundColor = .systemGroupedBackground
        makeLayout()
        
        
    }
}

extension AccountViewController {
    private func makeLayout() {
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    private func makeSegmentedControl() -> UISegmentedControl {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Light", at: 0, animated: false)
        segment.insertSegment(withTitle: "Dark", at: 1, animated: false)
        segment.selectedSegmentIndex = 1
        segment.backgroundColor = .gray
        segment.selectedSegmentTintColor = .darkGray
        let segmentWidth: CGFloat = 180
        let segmentHeight: CGFloat = 30
        segment.frame = CGRect(x: 0, y: 0, width: segmentWidth, height: segmentHeight)
        
        segment.addTarget(self, action: #selector(segmentValueChange(_:)), for: .touchUpInside)
        return segment
    }
    
    @objc
    private func segmentValueChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                }
            }
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        }
    }
}



extension AccountViewController: UITableViewDataSource {
    
    // Сколько секций в таблице?
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    // Сколько строк в конкретной секции?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsInSections[section].count // Отвечаем
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemsInSections[indexPath.section][indexPath.row]
        if case .textField(let textField) = item {
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseId, for: indexPath) as! AccountTableViewCell
            cell.configure(placeholder: textField.title ?? "Unknown item")
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        if case .appearance = item {
            configuration.text = "Appearance"
            let segment = makeSegmentedControl()
            cell.accessoryView = segment
        }
        
        else if case .logout = item {
            configuration.text = "Logout"
            configuration.textProperties.color = .systemRed
        }
        
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return Section.profile.title
        } else if section == 1 {
            return Section.settings.title
        }
        return nil
    }
}






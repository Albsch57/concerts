//
//  ConditionsViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 28.06.2023.
//

import UIKit

class ConditionsViewController: UIViewController {

    private let titleLabelOne: UILabel = {
        let label = UILabel()
        label.text = "1) Disclaimer."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let descriptioneOne: UILabel = {
        let label = UILabel()
        label.text = "These Terms of Service are only for demo purpose. Do not use them for a real project. These are only an example of  the legally binding terms and conditions for the use of the app and the Services."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "2) Acceptance of Terms."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let descriptioneTwo: UILabel = {
        let label = UILabel()
        label.text = "1. By registering for and/or using the Services in any manner, including but not limited to visiting or browsing the app, you agree to these Terms of Service (including, for clarity, the Privacy Policy and, where applicable, the EU Data Processing Addendum) and all other operating rules, policies and procedures that may be published from time to time on the Site by us, each of which is incorporated by reference and each of which may be updated from time to time without notice to you."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let descriptioneThree: UILabel = {
        let label = UILabel()
        label.text = "2. Certain of the Services may be subject to additional terms and conditions specified by us from time to time; your use of such Services is subject to those additional terms and conditions, which are incorporated into these Terms of Service by this reference."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptioneFour: UILabel = {
        let label = UILabel()
        label.text = "3. These Terms of Service apply to all users of the Services, including, without limitation, users who are contributors of content, information, and other materials or services, registered or otherwise."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conditions of Use"
        view.backgroundColor = .systemGroupedBackground
    
        let okMark = UIBarButtonItem(title: "OK", style: .plain, target: self, action: nil)
        okMark.tintColor = .red
        navigationItem.rightBarButtonItem = okMark
      
        // серая полоска
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .secondaryLabel

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        makeLayout()
        
        // Do any additional setup after loading the view.
    }
}

extension ConditionsViewController {
    func makeLayout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabelOne)
        stackView.addArrangedSubview(descriptioneOne)
        stackView.addArrangedSubview(titleLabelTwo)
        stackView.addArrangedSubview(descriptioneTwo)
        stackView.addArrangedSubview(descriptioneThree)
        stackView.addArrangedSubview(descriptioneFour)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
    }
}

//
//  RegisterView.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import UIKit

class RegisterView: UIView {
    
    private let imageFont: UIImageView = {
        var image = UIImageView(image: UIImage(named: "login"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleBcn: UILabel = {
        let label = UILabel()
        label.text = "BCN"
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 41).isActive = true
        label.textAlignment = .center
        return label
    }()
    
    private let titleConcert: UILabel = {
        let label = UILabel()
        label.text = "CONCERTS"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let segmentedControll: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Register", at: 0, animated: false)
        segment.insertSegment(withTitle: "Login", at: 1, animated: false)
        segment.selectedSegmentIndex = 1
        segment.backgroundColor = .gray
        segment.selectedSegmentTintColor = .darkGray
        segment.translatesAutoresizingMaskIntoConstraints = false
        let segmentWidth: CGFloat = 363
        let segmentHeight: CGFloat = 32
        segment.frame = CGRect(x: 0, y: 0, width: segmentWidth, height: segmentHeight)
    
        return segment
    }()
    
    
    let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .white
        textField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.5)
        //     textField.backgroundColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    let textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .white
        textField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.5)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    let button: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Sign In"
        configuration.baseBackgroundColor = .systemRed
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .large
        configuration.contentInsets = .init(top: 16, leading: 0, bottom: 16, trailing: 0)
        let button = UIButton(configuration: configuration)
        return button
    }()
    
    private let titleForgotPassword: UILabel = {
        let label = UILabel()
        label.text = "Accept with our"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleForgotAccount: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account?"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonConditions: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let attributedTitle = NSAttributedString(string: "conditions", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue, .underlineColor: UIColor.systemRed])
        configuration.attributedTitle = AttributedString(attributedTitle)
        configuration.baseForegroundColor = .systemRed
        configuration.baseBackgroundColor = .clear
        let button = UIButton(configuration: configuration)
        return button
    }()
    
  
    private let stackViewConditions: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonRegister: UIButton = {
        var configuration = UIButton.Configuration.filled()
        let attributedTitle = NSAttributedString(string: "Register", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue, .underlineColor: UIColor.systemRed])
        configuration.attributedTitle = AttributedString(attributedTitle)
        configuration.baseForegroundColor = .systemRed
        configuration.baseBackgroundColor = .clear
        let button = UIButton(configuration: configuration)
        return button
    }()
    
    private let stackViewRegister: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension RegisterView {
    
   
    
    func makeLayout() {
        
        segmentedControll.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        
        addSubview(imageFont)
        NSLayoutConstraint.activate([
            imageFont.topAnchor.constraint(equalTo: topAnchor),
            imageFont.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageFont.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageFont.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        stackViewConditions.addArrangedSubview(titleForgotPassword)
        stackViewConditions.addArrangedSubview(buttonConditions)
        
        stackViewRegister.addArrangedSubview(titleForgotAccount)
        stackViewRegister.addArrangedSubview(buttonRegister)
        
        
        stackView.addArrangedSubview(titleBcn)
        stackView.addArrangedSubview(titleConcert)
        stackView.addArrangedSubview(segmentedControll)
        stackView.addArrangedSubview(textFieldEmail)
        stackView.addArrangedSubview(textFieldPassword)
        stackView.addArrangedSubview(button)
//        stackView.addArrangedSubview(titleForgotPassword)
        stackView.addArrangedSubview(stackViewConditions)
//        stackView.addArrangedSubview(titleForgotAccount)
        stackView.addArrangedSubview(stackViewRegister)
        
        
        addSubview(stackView)
        
        stackView.setCustomSpacing(64, after: titleConcert)
        stackView.setCustomSpacing(10, after: textFieldEmail)
        stackView.setCustomSpacing(16, after: titleForgotPassword)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50
                                          ),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
    @objc
    func changeSegmentIndex(_ index: Int) {
        if index == 1 {
            button.configuration?.title = "Sign in"
        //    titleForgotPassword.text = "Forgot password?"
            buttonRegister.configuration?.title = "Register"
            titleForgotAccount.text = "Don't have an account?"
        } else {
            button.configuration?.title = "Sign up"
    //        titleForgotPassword.text = "By signing up, you  accept our"
            buttonRegister.configuration?.title = "Login"
            titleForgotAccount.text = "Have an account?"
        }
    }
    
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSegmentIndex(sender.selectedSegmentIndex)
    }
}

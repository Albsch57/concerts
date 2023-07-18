//
//  RegisterViewController.swift
//  Concerts
//
//  Created by Alyona Bedrosova on 21.06.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let viewModel = RegisterViewModel()
    private let registerView = RegisterView()
    
    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.button.addTarget(self, action: #selector(buttonIsTapped(_:)), for: .touchUpInside)
        registerView.buttonConditions.addTarget(self, action: #selector(conditionsIsTapped), for: .touchUpInside)
        registerView.buttonRegister.addTarget(self, action: #selector(registerIsTapped(_:)), for: .touchUpInside)
        
    }

}

extension RegisterViewController {
    
    @objc
    private func conditionsIsTapped() {
        let conditionsViewController = ConditionsViewController()
        navigationController?.present(conditionsViewController, animated: true)
    }
    
    @objc
    private func registerIsTapped(_ sender: UIButton) {

        if registerView.segmentedControll.selectedSegmentIndex == 1 {
            registerView.segmentedControll.selectedSegmentIndex = 0
            registerView.changeSegmentIndex(0)
        } else {
            registerView.segmentedControll.selectedSegmentIndex = 1
            registerView.changeSegmentIndex(1)
        }
    }
    
    
    @objc
    private func buttonIsTapped(_ sender: UIButton) {
        guard let email = registerView.textFieldEmail.text else { return }
        guard let password = registerView.textFieldPassword.text else { return }
        
        // 1. Check email
        guard email.isValidEmail() else { return }
        
        // 2. Check password
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        if registerView.segmentedControll.selectedSegmentIndex == 1 {
            let authResult = viewModel.loginUser(email: email, password: password)
            if case .success(let user) = authResult{
                auth(for: user)
            } else if case .failure(let error) = authResult {
                showAlert(textMessage: error.textDescription)
            }
            
        } else {
            let registrationResult = viewModel.registerUser(email: email, password: password)
            if case .success(let user) = registrationResult {
                auth(for: user)
            }
            
            else if case .failure(let error) = registrationResult {
                showAlert(textMessage: error.textDescription)
            }
        }
    }
    
    private func showAlert(textMessage: String) {
        let alertController = UIAlertController(title: "Oops", message: textMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    #warning("Придумать нормальное название")
    private func auth(for user: User) {
        UserDefaults.standard.set(user.email!, forKey: "authenticatedUser")
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.rootViewController = TabBarViewController()
    }
}

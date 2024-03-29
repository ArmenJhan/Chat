//
//  SignUpViewController.swift
//  Chat
//
//  Created by Armen Madoyan on 09.03.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Cood to see you", font: .avenir(size: 26))
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir(size: 20))
    let passwordTextField = OneLineTextField(font: .avenir(size: 20))
    let confirmPasswordTextField = OneLineTextField(font: .avenir(size: 20))
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .darkButton())

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.redButton(), for: .normal)
        button.titleLabel?.font = .avenir(size: 20)
        return button
    }()
    
    weak var delegate: AuthNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc private func signUpButtonPressed() {
        AuthService.shared.register(
            email: emailTextField.text,
            password: passwordTextField.text,
            confirmPassword: confirmPasswordTextField.text
        ) { result in
            switch result {
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы зарегены") { 
                    self.present(SetupProfileViewController(currentUser: user), animated: true)
                }
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
                
            }
        }
    }
    
    @objc private func loginButtonPressed() {
        dismiss(animated: true) {
            self.delegate?.toLoginVC()
        }
    }
}

// MARK: - NSLayoutConstraints

extension SignUpViewController {
    private func setupConstraints() {
        
        let emailStackView = UIStackView(
            arrangedSubviews: [emailLabel, emailTextField],
            axis: .vertical,
            spacing: 0
        )
        
        let passwordStackView = UIStackView(
            arrangedSubviews: [passwordLabel, passwordTextField],
            axis: .vertical,
            spacing: 0
        )
        
        let confirmPasswordStackView = UIStackView(
            arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField],
            axis: .vertical,
            spacing: 0
        )
        
        signUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let stackView = UIStackView(
            arrangedSubviews: [
                emailStackView,
                passwordStackView,
                confirmPasswordStackView,
                signUpButton
            ],
            axis: .vertical,
            spacing: 30
        )
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(
            arrangedSubviews: [alreadyOnboardLabel, loginButton],
            axis: .horizontal,
            spacing: 10
        )
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
       
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo:  view.topAnchor, constant:  140),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: @escaping(() -> Void) = {}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



// MARK: - SwiftUI Canvas
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some SignUpViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

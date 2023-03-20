//
//  LoginViewController.swift
//  Chat
//
//  Created by Armen Madoyan on 09.03.2023.
//

import UIKit

class LoginViewController: UIViewController {

    let welcomeLabel = UILabel(text: "Welcome back", font: .avenir(size: 26))
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccountLabel = UILabel(text: "Need an account?")
    
    let emailTextField = OneLineTextField(font: .avenir(size: 20))
    let passwordTextField = OneLineTextField(font: .avenir(size: 20))
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .darkButton())
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.redButton(), for: .normal)
        button.titleLabel?.font = .avenir(size: 20)
        return button
    }()
    
    weak var delegate: AuthNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
    }
    
    @objc private func loginButtonPressed() {
        print(#function)
        AuthService.shared.login(email: emailTextField.text, password: passwordTextField.text) { result in
            switch result {
            case .success(let user):
                self.showAlert(with: "Успешно", and: "Вы авторизованы") {
                    self.present(MainTabBarController(), animated: true)
                }
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
                
            }
        }
    }
    
    @objc private func signUpButtonPressed() {
        dismiss(animated: true) {
            self.delegate?.toSignUpVC()
        }
    }
}

// MARK: - NSLayoutConstraints
extension LoginViewController {
    private func setupConstraints() {
        googleButton.customizeGoogleButton()
        let loginWithAndGoogleButton = UIStackView(
            arrangedSubviews: [loginWithLabel, googleButton],
            axis: .vertical,
            spacing: 10
        )
        let emailAndTextField = UIStackView(
            arrangedSubviews: [emailLabel, emailTextField],
            axis: .vertical,
            spacing: 0
        )
        let passwordAndTextField = UIStackView(
            arrangedSubviews: [passwordLabel, passwordTextField],
            axis: .vertical,
            spacing: 0
        )
        
        let needAnAccAndSignUpButton = UIStackView(
            arrangedSubviews: [needAnAccountLabel, signUpButton],
            axis: .horizontal,
            spacing: 10
        )
        
        signUpButton.contentHorizontalAlignment = .leading
        needAnAccAndSignUpButton.alignment = .firstBaseline

        let stackView = UIStackView(
            arrangedSubviews: [
                loginWithAndGoogleButton,
                orLabel,
                emailAndTextField,
                passwordAndTextField,
                loginButton
            ],
            axis: .vertical,
            spacing: 20
        )

        stackView.distribution = .fill
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        needAnAccAndSignUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(needAnAccAndSignUpButton)
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            googleButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant:  160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40),
            
            needAnAccAndSignUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant:  20),
            needAnAccAndSignUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            needAnAccAndSignUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}



// MARK: - SwiftUI Canvas
import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some LoginViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

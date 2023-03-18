//
//  ProfileViewController.swift
//  Chat
//
//  Created by Armen Madoyan on 17.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human5"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Piter", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "Blabzx`zx`zcz`vzx", font: .systemFont(ofSize: 16, weight: .light))
    let myTextField = CustomTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        customizeElements()
        setupConstraints()
    }
    
    
}

// MARK: - UI
extension ProfileViewController {
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 2
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        guard let button = myTextField.rightView as? UIButton else { return }
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
    }
    
    @objc private func sendMessage() {
        print("message")
    }
    
    private func setupConstraints() {
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(myTextField)
        view.addSubview(imageView)
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant:  50),
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint (equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint (equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint (equalTo: containerView.trailingAnchor, constant: -24),

            aboutMeLabel.topAnchor.constraint (equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint (equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint (equalTo: containerView.trailingAnchor, constant: -24),

            myTextField.leadingAnchor.constraint (equalTo: containerView.leadingAnchor, constant: 24),
            myTextField.trailingAnchor.constraint (equalTo: containerView.trailingAnchor, constant: -24),
            myTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            myTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}


// MARK: - SwiftUI Canvas
import SwiftUI

struct ProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some ProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

//
//  ChatRequestViewController.swift
//  Chat
//
//  Created by Armen Madoyan on 18.03.2023.
//

import UIKit

class ChatRequestViewController: UIViewController {

    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Piter", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "Start a new chat", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "ACCEPT", font: .laoSangamMN20(), titleColor: .white, backgroundColor: .black, isShadow:  false, cornerRadius: 10)
    
    let denyButton = UIButton(title: "DENY", font: .laoSangamMN20(), titleColor: #colorLiteral(red: 0.8756850362, green: 0.2895075083, blue: 0.2576965988, alpha: 1), backgroundColor: .mainWhite(), isShadow: false, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        customizeElements()
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        acceptButton.applyGradients(cornerRadius: 10)
    }
}

extension ChatRequestViewController {
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 2
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        denyButton.layer.borderWidth = 1
        denyButton.layer.borderColor = #colorLiteral(red: 0.8756850362, green: 0.2895075083, blue: 0.2576965988, alpha: 1)
    }
    
    private func setupConstraints() {
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 10)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(buttonsStackView)
    
        
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

            buttonsStackView.leadingAnchor.constraint (equalTo: containerView.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint (equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}

// MARK: - SwiftUI Canvas
import SwiftUI

struct ChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> some ChatRequestViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

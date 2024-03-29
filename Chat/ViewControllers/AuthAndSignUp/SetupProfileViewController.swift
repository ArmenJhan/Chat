//
//  SetupProfileViewController.swift
//  Chat
//
//  Created by Armen Madoyan on 10.03.2023.
//

import UIKit
import FirebaseAuth

class SetupProfileViewController: UIViewController {
    
    
    let welcomeLabel = UILabel(text: "Setup Profile", font: .avenir(size: 26))
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
 
    let fullNameTextField = OneLineTextField(font: .avenir(size: 20))
    let aboutMeTextField = OneLineTextField(font: .avenir(size: 20))
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "Male", at: 0, animated: true)
        control.insertSegment(withTitle: "Femail", at: 1, animated: true)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    let goToChatButton = UIButton(title: "Go to chats", titleColor: .white, backgroundColor: .darkButton())
    
    let profileImage = AddPhotoView()
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupConstraints()
        goToChatButton.addTarget(self, action: #selector(goToChatButtonPressed), for: .touchUpInside)
    }
    
    @objc private func goToChatButtonPressed() {
        FirestoreService.shared.saveProfileWith(
            id: currentUser.uid,
            email: currentUser.email ?? "",
            username: fullNameTextField.text,
            avatarImageString: "nil ",
            description: aboutMeTextField.text,
            sex: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex )) { result in
                switch result {
                case .success(let muser):
                    self.showAlert(with: "Success", and: "Приятного общения")
                    print(muser)
                case .failure(let error):
                    self.showAlert(with: "Failure", and: error.localizedDescription)
                }
            }
    }
}

// MARK: - NSLyaoutConstraints
extension SetupProfileViewController {
    private func setupConstraints() {
        let fullNameLabelAndTF = UIStackView(
            arrangedSubviews: [fullNameLabel, fullNameTextField],
            axis: .vertical,
            spacing: 0
        )
        let aboutMeLabelAndTF = UIStackView(
            arrangedSubviews: [aboutMeLabel, aboutMeTextField],
            axis: .vertical,
            spacing: 0
        )
        let sexLabelAndSegmentedControl = UIStackView(
            arrangedSubviews: [sexLabel, segmentedControl],
            axis: .vertical,
            spacing: 10
        )
        
        let stackView = UIStackView(
            arrangedSubviews: [fullNameLabelAndTF,aboutMeLabelAndTF,sexLabelAndSegmentedControl, goToChatButton],
            axis: .vertical, spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(profileImage)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            
            profileImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 80),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 70),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            goToChatButton.heightAnchor.constraint(equalToConstant: 60)
            
            

        ])
    }
}

// MARK: - SwiftUI Canvas
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: Context) -> some SetupProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

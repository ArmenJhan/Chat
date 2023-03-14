//
//  ActiveChatCell.swift
//  Chat
//
//  Created by Armen Madoyan on 13.03.2023.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfigureCellProtocol {
    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User Name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let leftGradientView = GradientView(startPoint: .topTrailing, endPoint: .bottomLeading, startColor: #colorLiteral(red: 0.8505791084, green: 0.3410350126, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0.6121320483, green: 0.5, blue: 0.9170946241, alpha: 1))
    let rightGradientView = GradientView(startPoint: .topLeading, endPoint: .bottomTrailing, startColor: #colorLiteral(red: 0.8505791084, green: 0.3410350126, blue: 1, alpha: 1), endColor: #colorLiteral(red: 0.6121320483, green: 0.5, blue: 0.9170946241, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(named: value.userImageString)
        friendName.text = value.username
        lastMessage.text = value.lastMessage
    }
    
    func setConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelStack = UIStackView(arrangedSubviews: [friendName, lastMessage], axis: .vertical, spacing: 0)
        let stackView = UIStackView(arrangedSubviews: [leftGradientView, labelStack, rightGradientView], axis: .horizontal, spacing: 10)

        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        labelStack.distribution = .fillEqually
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        
        addSubview(friendImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78),
            
            leftGradientView.heightAnchor.constraint(equalToConstant: 78),
            leftGradientView.widthAnchor.constraint(equalToConstant: 12),
            
            rightGradientView.heightAnchor.constraint(equalToConstant: 78),
            rightGradientView.widthAnchor.constraint(equalToConstant: 12),
            
            stackView.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

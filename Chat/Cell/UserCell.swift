//
//  UserCell.swift
//  Chat
//
//  Created by Armen Madoyan on 16.03.2023.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfigureCellProtocol {
    
    let userImageView = UIImageView()
    let userLabel = UILabel(text: "text", font: .laoSangamMN20())
    let containerView = UIView()
    
    static var reuseId = "UserCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .mainWhite()
        setupConstraints()
       
        self.layer.shadowColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.containerView.layer.cornerRadius = 10
        self.containerView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user = value as? MUser else { return }
        userImageView.image = UIImage(named: user.userImageString)
        userLabel.text = user.username
        print("")
    }
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.layer.cornerRadius = self.frame.size.width  / 2
        userImageView.clipsToBounds = true
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        addSubview(containerView)
        containerView.addSubview(userImageView)
        containerView.addSubview(userLabel)
     
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            userImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: containerView.widthAnchor),
            
            userLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor,constant: 4),
            userLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            userLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            userLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}

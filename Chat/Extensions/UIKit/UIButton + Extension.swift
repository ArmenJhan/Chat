//
//  UIButton + Extension.swift
//  Chat
//
//  Created by Armen Madoyan on 08.03.2023.
//

import UIKit

extension UIButton {
    
    convenience init(
        title: String,
        font: UIFont? = .avenir(size: 20),
        titleColor: UIColor,
        backgroundColor: UIColor,
        isShadow: Bool = false,
        cornerRadius: CGFloat = 10 
    ) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButton() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

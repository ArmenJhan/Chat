//
//  AddPhotoView.swift
//  Chat
//
//  Created by Armen Madoyan on 10.03.2023.
//

import UIKit

class AddPhotoView: UIView {
    
    let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    let plusButtom: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .darkButton()
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButtom)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
        circleImageView.layer.masksToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                circleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
                circleImageView.heightAnchor.constraint(equalToConstant: 100),
                circleImageView.widthAnchor.constraint(equalToConstant: 100),
                
                plusButtom.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                plusButtom.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 15),
                plusButtom.heightAnchor.constraint(equalToConstant: 30),
                plusButtom.widthAnchor.constraint(equalToConstant: 30),
                
                self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor),
                self.trailingAnchor.constraint(equalTo: plusButtom.trailingAnchor)
            ]
        )
    }
}

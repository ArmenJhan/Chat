//
//  UIImageView + Extension.swift
//  Chat
//
//  Created by Armen Madoyan on 08.03.2023.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}

extension UIImageView {
    func setupColor(color: UIColor) {
        let tempalteImpage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = tempalteImpage
        self.tintColor = color
        
    }
}

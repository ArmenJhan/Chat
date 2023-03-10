//
//  Label + Extension.swift
//  Chat
//
//  Created by Armen Madoyan on 08.03.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .avenir(size: 20)) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

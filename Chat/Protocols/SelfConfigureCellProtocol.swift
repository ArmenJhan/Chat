//
//  SelfConfigureCellProtocol.swift
//  Chat
//
//  Created by Armen Madoyan on 14.03.2023.
//

import UIKit

protocol SelfConfigureCellProtocol {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}

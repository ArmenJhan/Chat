//
//  AuthNavigationDelegate.swift
//  Chat
//
//  Created by Armen Madoyan on 20.03.2023.
//

import Foundation

protocol AuthNavigationDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}

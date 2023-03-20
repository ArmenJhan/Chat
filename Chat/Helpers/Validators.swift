//
//  Validators.swift
//  Chat
//
//  Created by Armen Madoyan on 19.03.2023.
//

import UIKit

class Validators {
    static func isFillied(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard
            let email = email,
            let password = password,
            let confirmPassword = confirmPassword,
            email != "",
            password != "",
            confirmPassword != ""
        else {
            return false
        }
        return true
    }
    
    static func isFillied(username: String?, description: String?, sex: String?) -> Bool {
        guard
            let username = username,
            let description = description,
            let sex = sex,
            username != "",
            description != "",
            sex != ""
        else {
            return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}

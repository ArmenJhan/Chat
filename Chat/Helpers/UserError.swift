//
//  UserError.swift
//  Chat
//
//  Created by Armen Madoyan on 20.03.2023.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotGetUserInfo
    case cannotUnwrapToMuser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Выберите фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Нет информации по юзеру", comment: "")
        case .cannotUnwrapToMuser:
            return NSLocalizedString("Невозможно конвертировать MUser из User", comment: "")
        }
    }
}

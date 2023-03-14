//
//  Users.swift
//  Chat
//
//  Created by Armen Madoyan on 14.03.2023.
//

struct User: Hashable, Decodable {
    var username: String
    var userImageString: String
    var id: Int
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}


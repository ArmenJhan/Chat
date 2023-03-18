//
//  Users.swift
//  Chat
//
//  Created by Armen Madoyan on 14.03.2023.
//

struct MUser: Hashable, Decodable {
    var username: String
    var userImageString: String
    var id: Int
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty {
            return true
        }
        let lowerCasedFolter = filter.lowercased()
        return username.lowercased().contains(lowerCasedFolter)
    }
}


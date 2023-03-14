//
//  MChat.swift
//  Chat
//
//  Created by Armen Madoyan on 14.03.2023.
//

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash (into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

//
//  FirestoreService.swift
//  Chat
//
//  Created by Armen Madoyan on 20.03.2023.
//

import Firebase
import FirebaseFirestore

class FirestoreService {
    static let shared = FirestoreService()
    
    let dataBase = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return dataBase.collection("users ")
    }
    
    private init() {}
    
    func getUserData(user: User, completion: @escaping(Result<MUser, Error>) -> Void) {
        let docRef = userRef.document(user.uid)
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToMuser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
    
    func saveProfileWith(
        id: String,
        email: String,
        username: String?,
        avatarImageString: String?,
        description: String?,
        sex: String?,
        completion: @escaping(Result<MUser, Error>) -> Void
    ) {
        guard Validators.isFillied(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(
            username: username ?? "",
            email: email,
            userImageString: "not exist",
            description: description ?? "",
            sex: sex ?? "",
            id: id
        )
        
        self.userRef.document(muser.id).setData(muser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
}

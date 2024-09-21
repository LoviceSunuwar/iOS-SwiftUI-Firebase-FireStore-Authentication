//
//  AuthenticationManager.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//

import Foundation
import FirebaseAuth

// MARK: Auth Data MODEL

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init (user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
    
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager() // Singleton Design pattern
    private init(){
        
    }
    // Reaching to the user locally
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    
    func createUser(email: String, password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataResultModel(user: authDataResult.user)
        return result
    }
    
    func signOut() throws {
       try Auth.auth().signOut()
    }
}

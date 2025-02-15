//
//  AuthViewModel.swift
//  PopEng
//
//  Created by Adam Khalifa on 11.02.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
 
    
    init(){}
    
    func signIn(withEmail email: String, password: String) async throws {
       print("sign in ")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)

        } catch {
            print("\(error.localizedDescription)")
            
        }
        
    }
    
    func signOut() {
        
    }
    
    func fetchUser() {
        
    }
}

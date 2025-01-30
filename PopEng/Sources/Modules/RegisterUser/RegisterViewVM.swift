//
//  RegisterViewVM.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init() {}
    //main function
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: emailAddress, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    //creates a user, a document and a collection
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, 
                           name: name,
                           email: emailAddress,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    //validates email  address and password length
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "It says EEE-mail, comprende?!"
            return false
        }
        guard emailAddress.contains("@") && emailAddress.contains(".") else {
            errorMsg = "It says EEE-mail, comprende?!"
            return false
        }
        
        guard password.count >= 6 else {
            errorMsg = "good attempt, but your Password is too short"
            return false
        }
        return true
    }
}

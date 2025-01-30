//
//  LoginViewVM.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//
import FirebaseAuth
import Foundation

class LoginViewVM: ObservableObject {
    @Published var emailAddress = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        //try log in
        Auth.auth().signIn(withEmail: emailAddress, password: password)
    }
    
    private func validate() -> Bool{
        guard !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "please fill in all fields"
            return false
        }
        guard emailAddress.contains("@") && emailAddress.contains(".") else {
            errorMsg = "please enter a valid email address"
            return false
        }
        return true
    }
}

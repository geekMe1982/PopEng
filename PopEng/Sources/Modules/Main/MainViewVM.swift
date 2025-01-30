//
//  MainViewVM.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import FirebaseAuth
import Foundation

class MainViewVM: ObservableObject {
    @Published var currentUserID: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

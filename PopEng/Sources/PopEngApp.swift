//
//  PopEngApp.swift
//  PopEng
//
//  Created by Adam Khalifa on 18.08.2024.
//

import SwiftUI
import Firebase

@main
struct PopEngApp: App {
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}

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

    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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

//class AppDelegate:NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions : [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

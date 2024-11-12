//
//  PopEngApp.swift
//  PopEng
//
//  Created by Adam Khalifa on 18.08.2024.
//

import FirebaseCore
import SwiftUI

@main
struct PopEngApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            GetStartedView()
        }
    }
}

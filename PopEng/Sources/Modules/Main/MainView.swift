//
//  ContentView.swift
//  PopEng
//
//  Created by Adam Khalifa on 18.08.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                UserProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}

//
//  RegisterView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel =  RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(subtitle: "Start your journey now")
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(Color.red)
                    }
                    TextField("Full name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email", text: $viewModel.emailAddress)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("password", text: $viewModel.password)
                    Button("Sign up") {
                        viewModel.register()
                    }
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}

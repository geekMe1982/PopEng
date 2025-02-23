//
//  LoginView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI
import  Lottie

struct LoginView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                //Animation
                ZStack {
                    LottieView(animation: .named("Confetti"))
                        .playbackMode(.playing(.toProgress(1,loopMode: .loop)))
                        .resizable()
                    Image("POP")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 32)
                }
                .frame(width: 200, height: 200)
                
                //login fields
                VStack(spacing: 24) {
                    InputView(text: $viewModel.email,
                              title: "email address",
                              placeHolder: "name@example.com", mode: .normal)
                    .autocapitalization(.none)
                    
                    InputView(text: $viewModel.password,
                              title: "password",
                              placeHolder: "enter your password",
                              mode: .secure)
                }
                .autocapitalization(.none)
                .padding(.horizontal)
                
                Spacer()
                
                //sign in button
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 52)
                }
                .background(Color(.systemPurple))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                //sign up button
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("New around here?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

extension LoginView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    
}

#Preview {
    LoginView()
}

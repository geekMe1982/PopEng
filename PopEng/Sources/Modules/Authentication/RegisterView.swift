//
//  RegisterView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI


struct RegisterView: View {
    @State var email = ""
    @State var fullName = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var errorMsg = ""
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(subtitle: "Start your journey now")
                    .frame(height: 200)
                    .padding(70)
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeHolder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $fullName,
                              title: "Full Name",
                              placeHolder: "Enter your name")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeHolder: "enter your password",
                              isSecureField: true)
                    
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeHolder: "enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                Button {
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                       fullName: fullName)
                    }
                } label: {
                    HStack {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 52)
                }
                .background(Color(.systemPurple))
                .cornerRadius(10)
                .padding(.top, 12)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}


#Preview {
    RegisterView()
}

//
//class RegisterViewVM: ObservableObject {
//
//
//    
//
//    
//    private func validate() -> Bool{
//        guard
//            !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty,
//            !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//            errorMsg = "It says EEE-mail, comprende?!"
//            return false
//        }
//        guard emailAddress.contains("@") && emailAddress.contains(".") else {
//            errorMsg = "It says EEE-mail, comprende?!"
//            return false
//        }
//        
//        guard password.count >= 6 else {
//            errorMsg = "good attempt, but your Password is too short"
//            return false
//        }
//        return true
//    }
//}

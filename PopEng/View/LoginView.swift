//
//  LoginView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI
import  Lottie

struct LoginView: View {
    @StateObject var viewModel = LoginViewVM()
    
    let gradient = Gradient(colors: [.red, .purple, .blue])
    
    var body: some View {
        NavigationView {
            VStack {
                //Animation
                ZStack {
                    LottieView(animation: .named("Confetti"))
                        .playbackMode(.playing(.toProgress(1,loopMode: .loop)))
                        .resizable()
                    Image("POP")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200, alignment: .center)
                }
          
                //login fields
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text("\(viewModel.errorMsg)")
                            .foregroundColor(Color.red)
                    }
                    TextField("enter your email",
                              text: $viewModel.emailAddress
                    )
                    .border(.linearGradient(gradient, startPoint: .center, endPoint: .bottomTrailing))
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
                    TextField("enter your pasword",
                              text: $viewModel.password
                    )
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.linearGradient(gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.primary)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                //sign up
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    LoginView()
}

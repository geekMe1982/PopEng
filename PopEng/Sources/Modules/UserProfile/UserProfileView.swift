//
//  ProfileView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI

struct UserProfileView: View {
    //@State private var showSigninView: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack(spacing: 20) {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width:72, height: 72)
                            .background(Color(.systemPurple))
                            .clipShape(.circle)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign Out",
                                        tintColor: .red)
                    }
                    Button {
                        
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "delete account",
                                        tintColor: .red)
                    }
                }
            }
        }

    }
}

#Preview {
    UserProfileView()
}

//
//  ProfileView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Adam Khalifa")
                    Image("profileImage")
                        .resizable()
                        .cornerRadius(100.0)
                        .padding()
                        .frame(width:150,
                               height: 150)
                }
                VStack{
                    List{
                        Text("Date of birth:")
                        Text("Mobile number:")
                        Text("Subscribtion:")
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}

//
//  GettingStartedView.swift
//  PopEng
//
//  Created by Adam Khalifa on 04.11.2024.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image(Images.gettingStartedImage)
                        .resizable()
                        .scaledToFit()
                }
                VStack(spacing: 20.0) {
                    NavigationLink(destination:OnBoardingView())
                    {
                    Text("Get Started")
                        .font(.system(size: 18.0))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 100.0, bottom: 16, trailing: 100.0))
                        .background(Color.purple)
                        .cornerRadius(10.0)
                    }
                    Button("Already a member", action: {})
                        .font(.system(size: 18.0))
                        .foregroundColor(.purple)
                        .padding(EdgeInsets(top: 16, leading: 75, bottom: 16, trailing: 75))
                        .background(Color.clear)
                        .cornerRadius(10.0)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.purple, lineWidth: 2.0)
                        }
                }.padding(.top, 150)
            }
        }
    }
}

#Preview {
    GetStartedView()
}

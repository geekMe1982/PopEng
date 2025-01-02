//
//  OnBoardingView.swift
//  PopEng
//
//  Created by Adam Khalifa on 05.11.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isFirstViewPresented = true
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30.0)
                            .foregroundColor(Color.purple)
                            .bold()
                    }
                    .padding()
                    Spacer()
                }.padding(.bottom, 80)
                ZStack {
                    SpeechBubble(cornerRadius: 20,
                                 isBottom: true,
                                 pointLocation: 100)
                    .fill(Color.purple)
                    Text(isFirstViewPresented ? Texts.onBoardingText1 : Texts.onBoardingText2)
                        .foregroundStyle(.white)
                        .font(.system(size: 20).bold())
                        .padding()
                }.frame(width: isFirstViewPresented ? 220 : 350, height: 80)
                Image(isFirstViewPresented ? Images.OnBoarding1 : Images.onboarding2)
                    .resizable()
                    .scaledToFit()
                    .offset(x:-20, y: -30)
                    .padding()
                Button(action: {
                    isFirstViewPresented = false
                }){
                    Text("Continue")
                        .font(.system(size: 18.0))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(
                            top: 16,
                            leading: 100.0,
                            bottom: 16,
                            trailing: 100.0))
                        .background(Color.purple)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoardingView()
}

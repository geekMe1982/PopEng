//
//  OnBoardingView.swift
//  PopEng
//
//  Created by Adam Khalifa on 05.11.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isFirstViewPresented = true
    @State private var navigationPath = NavigationPath()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                HStack {
                    Button(action: {
                       dismiss()
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
                    if isFirstViewPresented {
                        isFirstViewPresented = false
                    } else {
                        navigationPath.append("toQuestions")
                    }
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
            .navigationDestination(for: String.self) { route in
                           switch route {
                           case "toQuestions":
                               OnboardingQuestionView()
                           default:
                               LoginView()
                           }
                       }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoardingView()
}

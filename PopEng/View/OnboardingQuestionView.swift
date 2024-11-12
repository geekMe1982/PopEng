//
//  OnboardingQuestionView.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import SwiftUI  

struct OnboardingQuestionView: View {
    @State private var progress = 0.2
    @State private var index = 0
    @State private var selectedEntry = Array(1...Data.questions[0].answerImg.count).map{_ in false}
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>

    var body: some View {
        NavigationView{
            VStack{
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
                    }.padding()
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundStyle(Color.gray.opacity(0.3))
                            .frame(width: 300, height: 20.0)
                        Rectangle()
                            .foregroundStyle(Color.purple)
                            .frame(width: CGFloat(progress)*300, height: 20.0)
                            .cornerRadius(10)
                    }.cornerRadius(10)
                }
                VStack {
                    ZStack {
                        SpeechBubble(cornerRadius: 100, isButtom: true, pointLocation: 100)
                        Text(Data.questions[index].query)
                            .font(.system(size: 20.0).bold())
                            .foregroundColor(Color.purple)
                    }
                    Image("CasualBoyDance")
                        .resizable()
                        .scaledToFit()
                }.padding()
            }
        }
    }
}

#Preview {
    OnboardingQuestionView()
}

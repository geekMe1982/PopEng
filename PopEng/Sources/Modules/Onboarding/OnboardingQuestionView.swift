//
//  OnboardingQuestionView.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isSecondViewPresented = true
    @State private var index = 0
    @State private var selectedEntry = Array(1...Data.questions[0].answerImg.count).map{_ in false}
    @StateObject var viewModel = OnboardingViewModel()
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
                    ProgressView(value: Float(index), total: Float(Data.questions.count)) // Add progress bar
                        .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                        .frame(width: 300) // Set width for the progress bar
                        .padding()
                }
                VStack {
                    ZStack {
                        SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 100)
                            .fill(Color.purple)
                            .frame(width: 330, height: 80)
                        Text(Data.questions[index].query)
                            .font(.system(size: 20.0).bold())
                            .foregroundColor(Color.white)
                    }
                    .frame(width: isSecondViewPresented ? 300 : 250)
                    Image(systemName: "person.fill.questionmark")
                        .resizable()
                        .scaledToFit()
                    LazyVStack {
                        ForEach(0..<viewModel.question.answerText.count, id: \.self) {i
                            in SelectionCardView(question: $viewModel.question, selectedEntry: $selectedEntry, queryIndex: index, selectedIndex: i)
                        }
                    }
                    
                    Button(action: {
                        if index < Data.questions.count - 1 {
                            index += 1
                            selectedEntry = Array(repeating: false, count: Data.questions[index].answerImg.count) // Reset selectedEntry
                            //isSecondViewPresented = true
                            viewModel.getQuestionAtIndex(index: index)
                            progress = CGFloat(index + 1) / CGFloat(Data.questions.count) // Update progress
                        } else {
                            
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
                    .disabled(!selectedEntry.contains(true)) // Disable button if no option is selected
                    .opacity(selectedEntry.contains(true) ? 1.0 : 0.5) // Change opacity for visual feedback
                }.padding()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingQuestionView()
}

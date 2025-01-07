//
//  OnboardingViewModel.swift
//  PopEng
//
//  Created by Adam Khalifa on 24.11.2024.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var question: QuestionModel
    var index: Int
    
    init() {
        question = QuestionModel(query: "", answerImg: [], answerText: [], answerSubText: [])
        index = 0
        self.getQuestionAtIndex(index: index)
      
    }
    
    func getQuestionAtIndex(index: Int) {
        question = Data.questions[index]
    }
}


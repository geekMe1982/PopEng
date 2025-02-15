//
//  Data.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import Foundation

struct Data {
    static let questions: [QuestionModel] =
    [
        QuestionModel(query: "What's your current level?",
                 answerImg: [Images.LLevel1, Images.LLevel2, Images.LLevel3],
                 answerText: ["I'm new to this language", "I know some words/phrases", "I'm intermediate or heigher"],
                 answerSubText: []),
        QuestionModel(query: "How much of the language do you know?",
                 answerImg: [Images.knowlegde1, Images.knowlegde2, Images.knowlegde3],
                 answerText: ["I studied English in school", "I took a course/hired a tutor", "I can engage in a simple conversation", "I know much"],
                 answerSubText: []),
        QuestionModel(query: "What's you daily learning goal?",
                 answerImg: [Images.knowlegde1, Images.knowlegde2, Images.knowlegde3],
                 answerText: ["10 min/day", "20 min/day", "30 min/day"],
                 answerSubText: [])
    ]
}

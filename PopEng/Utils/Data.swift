//
//  Data.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import Foundation
import FlagsKit

struct Data {
    static let questions: [Question] =
    [
        Question(query: "What's your current level?",
                 answerImg: [Images.LLevel1, Images.LLevel2, Images.LLevel3],
                 answerText: ["I'm new to this language", "I know some words/phrases", "I'm intermediate or heigher"],
                 answerSubText: []),
        Question(query: "How much of the language do you know?",
                 answerImg: [Images.knowlegde1, Images.knowlegde2, Images.knowlegde3, Images.knowlegde4],
                 answerText: ["I studied English in school", "I took a course/hired a tutor", "I can engage in a simple conversation", "I know much"],
                 answerSubText: []),
        Question(query: "What's you daily learning goal?",
                 answerImg: [],
                 answerText: ["10 min/day", "20 min/day", "30 min/day"],
                 answerSubText: ["Casual", "Regular", "Serious", "Intense"])
    ]
}

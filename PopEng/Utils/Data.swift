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
                 answerImg: ["fly", "hen", "diplodocus"],
                 answerText: ["I'm new to this language", "I know some words/phrases", "I'm intermediate or heigher"],
                 answerSubText: []),
        Question(query: "How much of the language do you know?",
                 answerImg: ["graph1", "graph2", "graph3", "graph4"],
                 answerText: ["I'm new to this language", "I know a few words/phrases", "I can engage in a simple conversation", "I know much"],
                 answerSubText: []),
        Question(query: "What's you daily learning goal?",
                 answerImg: [],
                 answerText: ["10 min/day", "20 min/day", "30 min/day"],
                 answerSubText: ["Casual", "Regular", "Serious", "Intense"])
    ]
}

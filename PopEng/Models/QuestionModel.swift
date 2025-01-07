//
//  Question.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import Foundation

struct QuestionModel: Identifiable {
    let id: String
    let query: String
    let answerImg: [String]
    let answerText: [String]
    let answerSubText: [String]
    
    init(id: String = UUID().uuidString, query: String, answerImg:[String], answerText:[String], answerSubText: [String] ) {
        self.id = id
        self.query = query
        self.answerImg = answerImg
        self.answerText = answerText
        self.answerSubText = answerSubText
    }
}

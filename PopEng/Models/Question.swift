//
//  Question.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.11.2024.
//

import Foundation

struct Question: Identifiable {
    let id = UUID().uuidString
    let query: String
    let answerImg: [String]
    let answerText: [String]
    let answerSubText: [String]
}

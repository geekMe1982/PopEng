//
//  User.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email:String
    let joined: TimeInterval
}

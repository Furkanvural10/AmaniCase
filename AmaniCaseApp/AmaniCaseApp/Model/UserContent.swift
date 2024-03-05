//
//  UserContent.swift
//  AmaniCaseApp
//
//  Created by furkan vural on 4.03.2024.
//

import Foundation

struct UserContent: Codable, Equatable {
    let images: [Detail]
}

struct Detail: Codable, Equatable {
    let id: Int
    let title: String
    let base64: String
    let description: String
}

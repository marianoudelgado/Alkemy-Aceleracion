//
//  SignUpDataResponse.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 16/02/2022.
//

import Foundation

struct SignUpResponse: Codable {
    let success: Bool
    let data: UserData
    let message: String
}

struct UserData: Codable {
    let user: UserInfo
    let token: String
}

struct UserInfo: Codable {
    let name, email, password: String
    let roleID: Int
    let updatedAt, createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name, email, password
        case roleID = "role_id"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}

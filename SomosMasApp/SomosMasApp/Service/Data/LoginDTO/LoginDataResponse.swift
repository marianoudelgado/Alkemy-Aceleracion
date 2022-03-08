//
//  LoginDataResponse.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

struct LoginDataResponse: Codable {
    
    let user: User
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
    }
    
}



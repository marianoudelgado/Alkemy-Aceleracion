//
//  LoginUserResponse.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

struct LoginUserResponse: Codable {
    
    let success: Bool
    let data: LoginDataResponse
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
        case message
    }
    
}

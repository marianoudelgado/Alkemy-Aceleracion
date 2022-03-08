//
//  SlidesDataResponse.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 02/03/2022.
//

import Foundation

struct SlidesDataResponse: Codable {
    
    let success: Bool
    let data: [Slides]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
        case message
    }
    
    
}

struct Slides: Codable  {
    
    let name: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
    }
    
}

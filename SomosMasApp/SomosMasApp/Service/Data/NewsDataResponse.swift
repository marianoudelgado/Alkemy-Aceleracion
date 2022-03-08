//
//  NewsDataResponse.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import Foundation

struct NewsDataResponse: Codable {
    let success: Bool
    let data: [News]
    let message: String
}

struct News: Codable {
    let id: Int?
    let name: String?
    let content: String?
    let image: String?
    let categoryID: Int?
    let createdAt, updatedAt: String?
    let groupID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, content, image
        case categoryID = "category_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case groupID = "group_id"
    }
}

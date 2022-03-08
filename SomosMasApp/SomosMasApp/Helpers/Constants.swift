//
//  Constants.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation

struct Constants {
    
    struct URL {
        
        static let BASE_URL = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String
        
        
        struct Endpoints {
            static let LOGIN = "/login"
            static let REGISTER = "/register"
            static let NEWS = "/news"
            static let SLIDES = "/slides"
        }
    }
    
}

//
//  APIManager.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 06/02/2022.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    
    typealias completionHandlerSlides = (_ requestStatus: SlidesDataResponse) -> Void
    typealias errorHandler = (_ errorData: String) -> Void

    
    func loginUser(email: String, password: String,  sucess: @escaping (_ loginDataResponse: LoginUserResponse) -> (), failure: @escaping ( _ error: Error?) -> () ) {

        let url = Constants.URL.BASE_URL+Constants.URL.Endpoints.LOGIN
        let params: [String: String] = ["email": email, "password": password]
        
        AF.request(url, method: .post, parameters: params,  encoder: JSONParameterEncoder.default).validate(statusCode: 200...299).responseDecodable(of: LoginUserResponse.self) {
            response in
            if let userResponse = response.value {
                sucess(userResponse)
            } else {
                failure(response.error)
            }
        }
        
    }
    
    func getSlides(onSuccess: @escaping completionHandlerSlides ,onFailure: @escaping errorHandler ) {
        
        let url = Constants.URL.BASE_URL+Constants.URL.Endpoints.SLIDES
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: SlidesDataResponse.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let dataResponse):
                onSuccess(dataResponse)
            case .failure(let errorData):
                onFailure(errorData.errorDescription ?? "Error")
            }
        }
    }
}



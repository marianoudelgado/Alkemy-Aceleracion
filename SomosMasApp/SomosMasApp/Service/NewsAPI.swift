//
//  NewsAPI.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import Foundation
import Alamofire

class NewsAPI {

    typealias completionHandler = (_ requestStatus: NewsDataResponse) -> Void
    typealias errorHandler = (_ errorData: String) -> Void

    let baseUrl = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as! String
    let endPoint = "/news"

    func getNews(onSuccess: @escaping completionHandler, onError: @escaping errorHandler){

        let url = baseUrl+endPoint
        let request = AF.request(url)
        request.responseDecodable(of: NewsDataResponse.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let dataResponse):
                onSuccess(dataResponse)
            case .failure(let errorData):
                onError(errorData.errorDescription ?? "Error")
            }
        }
    }
}

//
//  HomeViewModel.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 21/02/2022.
//

import Foundation

class HomeViewModel {
    let newsAPI = NewsAPI()
    var newsData: [News] = []{
        didSet {
            self.bindRequestData(newsData)
        }
    }
    
    var slidesData: [Slides] = [] {
        didSet {
            self.bindRequestSlidesData(slidesData)
        }
    }
    
    
    
    var bindStartRequest = {() -> Void in }
    var bindEndRequest = {() -> Void in }
    var bindErrorMessage = {(_ errorMessage: String) -> Void in }
    var bindRequestData = {(_ arrayNews: [News]) -> Void in }
    
    var bindRequestSlidesData = {(_ arraySlides: [Slides]) -> Void in }
    
    func getNews() {
        bindStartRequest()
        newsAPI.getNews { requestStatus in
            self.bindEndRequest()
            self.newsData = requestStatus.data
        } onError: { errorData in
            self.bindEndRequest()
            self.bindErrorMessage(errorData.debugDescription)
        }
    }
    
    func getSlides() {
        bindStartRequest()
        APIManager.shared.getSlides { requestStatus in
            self.bindEndRequest()
            self.slidesData = requestStatus.data
        } onFailure: { errorData in
            self.bindEndRequest()
            self.bindErrorMessage(errorData.debugDescription)
        }
    }
    
    let images = [
        HomeModel(ti:"Primera imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 3")),
        HomeModel(ti:"Segunda imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 5")),
        HomeModel(ti:"Tercera imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 4")),
        HomeModel(ti:"Cuarta imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 1")),
        HomeModel(ti:"Quinta imagen", te:"Esto es una descripcion breve de la imagen,Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 8")),
        HomeModel(ti:"Sexta imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 7")),
        HomeModel(ti:"Septima imagen", te:"Esto es una descripcion breve de la imagen,Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 4")),
        HomeModel(ti:"Octava imagen", te:"Esto es una descripcion breve de la imagen" ,im: #imageLiteral(resourceName: "Foto 1"))
    ]
    func slider() {
    }
}

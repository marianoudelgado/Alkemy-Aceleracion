//
//  HomeModel.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 02/03/2022.
//
import UIKit
import Foundation

struct HomeModel {
    
    let title: String
    //let asrrayImages = UIImage[#imageLiteral(resourceName: "Foto 10"), #imageLiteral(resourceName: "Foto 2"), #imageLiteral(resourceName: "Foto 4"), #imageLiteral(resourceName: "Foto 7"), #imageLiteral(resourceName: "Foto 1"), #imageLiteral(resourceName: "Foto 5"), #imageLiteral(resourceName: "Foto 4")]
    let image: UIImage?
    let text: String
    
    init(ti: String, te: String, im: UIImage){
        title = ti
        text = te
        image = im
    }
}

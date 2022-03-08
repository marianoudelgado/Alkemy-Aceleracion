//
//  NewsCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 01/03/2022.
//

import UIKit
import Alamofire

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getImage(linkData: String){
        let request = AF.request(linkData)
        DispatchQueue.global(qos: .background).async {
            request.response { dataResponse in
                guard let data = dataResponse.data else {return}
                self.newsImage.image = UIImage(data: data) ?? UIImage(named: "LOGO-SOMOS MAS")
            }
        }
        self.newsImage.contentMode = .scaleAspectFill
        self.newsImage.clipsToBounds = true
        self.newsImage.layer.cornerRadius = 12
    }
}

//
//  SliderCollectionViewCell.swift
//  SomosMasApp
//
//  Created by Mariano Uriel Delgado on 02/03/2022.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleCollectionViewCell: UILabel!
    @IBOutlet weak var imageCollectionViewCell: UIImageView!
    @IBOutlet weak var descriptionCollectionViewCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        descriptionCollectionViewCell.lineBreakMode = .byWordWrapping
        descriptionCollectionViewCell.numberOfLines = 0
        
        self.imageCollectionViewCell.contentMode = .scaleAspectFill
        self.imageCollectionViewCell.clipsToBounds = true
        self.imageCollectionViewCell.layer.cornerRadius = 12
    }

}

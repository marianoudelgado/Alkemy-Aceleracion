//
//  CustomTextField.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 28/01/2022.
//

import UIKit

class UnderlinedtextField: UITextField {
    
    var underline = CALayer()
    
    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    func setupUnderline() {
        
        borderStyle = .none
        
        let lineWidth: CGFloat = 1.0
        underline.borderColor =  UIColor.lightGray.cgColor
        underline.frame = CGRect(
            x: 0,
            y: frame.size.height - lineWidth,
            width: UIScreen.main.bounds.width,
            height: frame.size.height
        )
        underline.borderWidth = lineWidth
        
        layer.addSublayer(underline)
        layer.masksToBounds = true
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        setupUnderline()
    }
}



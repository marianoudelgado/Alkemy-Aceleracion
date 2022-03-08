//
//  Modals.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 13/02/2022.
//

import UIKit

extension UIViewController {

    func showAlertWithTitleRetry(title: String, message: String,titleButton: String, handler: @escaping () -> Void) {
        let action = UIAlertAction(title: titleButton, style: .default){
            UIAlertAction in handler()
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true){}
        alertController.addAction(action)
    }
}

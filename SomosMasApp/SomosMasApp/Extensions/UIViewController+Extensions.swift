//
//  UIViewController+Extensions.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 23/02/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setRootViewController(viewController: UIViewController) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
}

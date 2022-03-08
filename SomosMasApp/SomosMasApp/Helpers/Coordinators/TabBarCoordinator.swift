//
//  TabBarCoordinator.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 17/02/2022.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    func start() -> UIViewController {
        let mainTabBar = MainTabBarController()
        return mainTabBar
    }
    
}

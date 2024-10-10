//
//  HomeCoordinator.swift
//  CalcIMC
//
//  Created by Alan Pitanga on 09/10/24.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
         self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}

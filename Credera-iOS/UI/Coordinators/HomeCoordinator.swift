//
//  HomeCoordinator.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 1/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        viewController.delegate = self
        
        self.navigationController.viewControllers = [viewController]
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {

    // Navigate to Search page
    func navigateToSearchPage() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.delegate = self as? SearchViewControllerDelegate
        
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
}

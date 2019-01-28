//
//  SearchCoordinator.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 1/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: SearchViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        viewController.delegate = self
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator : SearchViewControllerDelegate {
    
    // Navigate to Search page
    func navigateToHomePage() {
        self.delegate?.navigateToHomePage()
    }
    
    // Navigate to Search Results page
    func navigateToSearchResultsPage() {
//        let thirdViewController : ThirdViewController = ThirdViewController()
//        thirdViewController.delegate = self
//
//        self.navigationController.pushViewController(thirdViewController, animated: true)
    }

}

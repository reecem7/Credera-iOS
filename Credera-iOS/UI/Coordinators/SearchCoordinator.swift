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
    
    // Navigate to Home page
    func navigateToHomePage() {
        self.navigationController.popToRootViewController(animated: true)
    }
    
    // Navigate to Search Results page
    func navigateToSearchResultsPage(searchQuery: String?) {
        
        // Create a view model with data to pass to the Search Results page
        let data = SearchQueryViewModel(searchQuery: searchQuery)
        
        // Initialize Storyboard and ViewController
        let storyboard = UIStoryboard(name: "SearchResults", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as! SearchResultsViewController
        
        viewController.delegate = self
        viewController.viewModel = data
        
        // Push ViewController on to the stack
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator : SearchResultsViewControllerDelegate {
    
    // Navigate to Search page
    func navigateToSearchPage() {
        self.navigationController.popViewController(animated: true)
    }
}

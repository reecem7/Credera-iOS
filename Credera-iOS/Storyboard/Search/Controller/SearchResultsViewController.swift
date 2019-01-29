//
//  SearchResultsViewController.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 1/28/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

public protocol SearchResultsViewControllerDelegate: SearchViewControllerDelegate {
    func navigateToSearchPage()
}

class SearchResultsViewController: UIViewController {
    public weak var delegate: SearchResultsViewControllerDelegate?
    public var viewModel: SearchQueryViewModel?
    
    @IBOutlet var searchTermLabel: UILabel!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchTerm: String? = viewModel?.searchQuery
        
        // Set search term text in label
        searchTermLabel.text = searchTerm
        
        // Determine the animation state of the loading indicator
        if (searchTerm?.isEmpty ?? true) {
            loadingIndicator.stopAnimating()
        } else {
            loadingIndicator.startAnimating()
        }
    }
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        self.delegate?.navigateToSearchPage()
    }
    
    @IBAction func onHomeButtonClicked(_ sender: UIButton) {
        self.delegate?.navigateToHomePage()
    }
}

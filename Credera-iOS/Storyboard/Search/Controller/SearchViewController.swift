//
//  SearchViewController.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 1/2/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

public protocol SearchViewControllerDelegate: class {
    func navigateToHomePage()
    func navigateToSearchResultsPage(searchQuery: String?)
}

class SearchViewController: UIViewController {
    public weak var delegate: SearchViewControllerDelegate?
    
    @IBOutlet var searchBox: UISearchBar!
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        let input = searchBox?.text
        self.delegate?.navigateToSearchResultsPage(searchQuery: input)
    }
}

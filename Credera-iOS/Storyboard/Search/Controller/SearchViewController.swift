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
    func navigateToSearchResultsPage()
}

class SearchViewController: UIViewController {
    public weak var delegate: SearchViewControllerDelegate?
}

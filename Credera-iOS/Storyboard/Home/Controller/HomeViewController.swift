//
//  HomeViewController.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 1/2/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

public protocol HomeViewControllerDelegate: class {
    func navigateToSearchPage()
}

class HomeViewController: UIViewController {
    
    public weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.titleView = AppHeaderView()
    }
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        self.delegate?.navigateToSearchPage()
    }
    
}

//
//  FirstViewController.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 1/2/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dependencyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = AppHeaderView()
        
        setupUI()
        
    }
    

    public func setupUI(){
        dependencyLabel.text = DependencyManager.shared.MainPageManager.mainPageText
    }
}

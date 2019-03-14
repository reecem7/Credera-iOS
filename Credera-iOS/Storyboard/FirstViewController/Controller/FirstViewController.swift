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
    
    
    var passedAlongInformationBetweenVC: String = "This is an example of passing information from one VC to another"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = AppHeaderView()
        
    }
    
    @IBAction func navigationExampleButtonClicked(_ sender: Any) {
        let navigationIntermediateScreen = NavigationIntermediateViewController.getInstance(passedInformation: passedAlongInformationBetweenVC)
        navigationController?.pushViewController(navigationIntermediateScreen, animated: true)
    }
    
}

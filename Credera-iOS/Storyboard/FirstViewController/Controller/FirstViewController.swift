//
//  FirstViewController.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 1/2/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationCompletedProtocol: class {
    func showNavigationCompleted()
}

class FirstViewController: UIViewController {
    
    let passedAlongInformationBetweenVC: String = "This is an example of passing information from one VC to another"
    
    @IBOutlet weak var navigationStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = AppHeaderView()
        
    }
    
    @IBAction func navigationExampleButtonClicked(_ sender: Any) {
        let navigationIntermediateScreen = NavigationIntermediateViewController.getInstance(passedInformation: passedAlongInformationBetweenVC, delegate: self)
        navigationController?.pushViewController(navigationIntermediateScreen, animated: true)
    }
    
}

extension FirstViewController: NavigationCompletedProtocol {
    func showNavigationCompleted() {
        navigationStatusLabel.text = "Navigation to Final VC has been completed"
        navigationStatusLabel.textColor = UIColor.red
    }
}

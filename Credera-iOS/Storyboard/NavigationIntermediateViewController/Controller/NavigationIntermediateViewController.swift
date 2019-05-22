//
//  NavigationIntermediateViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationIntermediateViewController: UIViewController, NavigationHelper {
    
    // Defines the type of data passed from the previous controller
    typealias PassedInfo = String
    typealias SpecificViewController = NavigationIntermediateViewController
    
    // Required variables for the NavigationHelper
    public class var storyboardName: String { return "NavigationIntermediate" }
    public class var viewControllerID: String { return "NavigationIntermediateViewController" }

    var passedInformation: String?
    weak var delegate: NavigationCompletedProtocol?
    
    @IBOutlet weak var passedInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // Required method for the NavigationHelper
    public static func getInstance(passedInformation: String, delegate: NavigationCompletedProtocol?) -> SpecificViewController {
        
        let navigationIntermediateController = getInstance()
        
        navigationIntermediateController.passedInformation = passedInformation
        navigationIntermediateController.delegate = delegate
        
        return navigationIntermediateController
    }
    
    func setupUI() {
        passedInformationLabel.text = passedInformation
    }
    
    @IBAction func navToFinalScreenClicked(_ sender: Any) {
        if let passedString = passedInformation, let navigationCompletedDelegate = delegate {
            let navigationFinalVC = NavigationFinalViewController.getInstance(passedInformation: passedString, delegate: navigationCompletedDelegate)
            navigationController?.pushViewController(navigationFinalVC, animated: true)
        }
    }
    
}

//
//  NavigationIntermediateViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationIntermediateViewController: UIViewController, NavigationProtocol {
    
    // Defines the type of data passed from the previous controller
    typealias Model = String
    typealias Delegate = NavigationCompletedProtocol
    
    // Required variables for the NavigationProtocol
    public class var storyboardName: String { return "NavigationIntermediate" }
    public class var viewControllerID: String { return "NavigationIntermediateViewController" }

    var model: String?
    weak var delegate: NavigationCompletedProtocol?
    
    @IBOutlet weak var passedInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    // Required method for the NavigationProtocol
    public static func getInstance(model: String, delegate: NavigationCompletedProtocol?) -> Self {
        
        let navigationIntermediateController = getInstance()
        
        navigationIntermediateController.model = model
        navigationIntermediateController.delegate = delegate
        
        return navigationIntermediateController
    }
    
    func setupUI() {
        passedInformationLabel.text = model
    }
    
    @IBAction func navToFinalScreenClicked(_ sender: Any) {
        if let passedString = model, let navigationCompletedDelegate = delegate {
            let navigationFinalVC = NavigationFinalViewController.getInstance(model: passedString, delegate: navigationCompletedDelegate)
            navigationController?.pushViewController(navigationFinalVC, animated: true)
        }
    }
    
}

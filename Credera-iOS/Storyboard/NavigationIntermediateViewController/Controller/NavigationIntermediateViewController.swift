//
//  NavigationIntermediateViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

protocol NavigationViewControllerProtocol {
    associatedtype PassedInfo
    static func getInstance(passedInformation: PassedInfo, delegate: NavigationCompletedProtocol?) -> UIViewController
}

class NavigationIntermediateViewController: UIViewController, NavigationHelper, NavigationViewControllerProtocol {
    typealias PassedInfo = String
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
    
    static func getInstance(passedInformation: String, delegate: NavigationCompletedProtocol?) -> UIViewController {
        guard let navigationIntermediateController = getInstance() as? NavigationIntermediateViewController else {
            return UIViewController()
        }
        
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

//
//  NavigationFinalViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationFinalViewController: UIViewController, NavigationHelper {
    
    // Defines the type of data passed from the previous controller
    typealias PassedInfo = String
    typealias SpecificViewController = NavigationFinalViewController
    
    // Required variables for the NavigationHelper
    public class var storyboardName: String { return "NavigationFinal" }
    public class var viewControllerID: String { return "NavigationFinalViewController" }
    
    @IBOutlet weak var passedInfoLabel: UILabel!
    
    var passedInfo: String?
    weak var delegate: NavigationCompletedProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Required method for the NavigationHelper
    public static func getInstance(passedInformation: String, delegate: NavigationCompletedProtocol?) -> SpecificViewController {

        let navigationFinalVC = getInstance()
        
        navigationFinalVC.passedInfo = passedInformation
        navigationFinalVC.delegate = delegate
        
        return navigationFinalVC
        
    }
    
    func setupUI() {
        passedInfoLabel.text = passedInfo
    }
    
    @IBAction func navBackToFirstVCClicked(_ sender: Any) {
        delegate?.showNavigationCompleted()
        navigationController?.popToRootViewController(animated: true)
    }
    
}

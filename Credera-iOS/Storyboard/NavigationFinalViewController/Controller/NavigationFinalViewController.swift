//
//  NavigationFinalViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationFinalViewController: UIViewController, NavigationProtocol {
    
    // Required variables for the NavigationProtocol
    public class var storyboardName: String { return "NavigationFinal" }
    public class var viewControllerID: String { return "NavigationFinalViewController" }
    
    // Defines the type of data passed from the previous controller and the method of communicating to previous controllers
    typealias Model = String
    typealias Delegate = NavigationCompletedProtocol
    
    @IBOutlet weak var passedInfoLabel: UILabel!
    
    var passedInfo: String?
    weak var delegate: NavigationCompletedProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Required method for the NavigationProtocol
    public static func getInstance(model: String, delegate: NavigationCompletedProtocol?) -> Self {

        let navigationFinalVC = getInstance()
        
        navigationFinalVC.passedInfo = model
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

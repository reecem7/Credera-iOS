//
//  NavigationFinalViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationFinalViewController: UIViewController, NavigationHelper, NavigationViewControllerProtocol {
    typealias PassedInfo = String
    public class var storyboardName: String { return "NavigationFinal" }
    public class var viewControllerID: String { return "NavigationFinalViewController" }
    
    @IBOutlet weak var passedInfoLabel: UILabel!
    
    var passedInfo: String?
    weak var delegate: NavigationCompletedProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    public static func getInstance(passedInformation: String, delegate: NavigationCompletedProtocol?) -> UIViewController {
        guard let navigationFinalVC = getInstance() as? NavigationFinalViewController else {
            return UIViewController()
        }
        
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

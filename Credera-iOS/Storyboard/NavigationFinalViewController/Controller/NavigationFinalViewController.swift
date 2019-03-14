//
//  NavigationFinalViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationFinalViewController: UIViewController, NavigationHelper {
    
    public class var storyboardName : String { get { return "NavigationFinal" } }
    public class var viewControllerID : String { get { return "NavigationFinalViewController" } }
    
    @IBOutlet weak var passedInfoLabel: UILabel!
    
    var passedInfo: String?
    var delegate: NavigationCompletedProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    public static func getInstance(passedInformation: String, delegate: NavigationCompletedProtocol) -> UIViewController {
        let navigationFinalVC = getInstance() as! NavigationFinalViewController
        
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

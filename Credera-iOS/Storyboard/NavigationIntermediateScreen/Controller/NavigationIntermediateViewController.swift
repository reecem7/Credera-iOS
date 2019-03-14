//
//  NavigationIntermediateViewController.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

class NavigationIntermediateViewController: UIViewController, NavigationHelper {
    
    public class var storyboardName : String { get { return "NavigationIntermediateScreen" } }
    public class var viewControllerID : String { get { return "NavigationIntermediateViewController" } }
    
    var passedInformation: String?
    
    @IBOutlet weak var passedInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    public static func getInstance(passedInformation: String) -> UIViewController {
        let navigationIntermediateController = getInstance() as! NavigationIntermediateViewController
        navigationIntermediateController.passedInformation = passedInformation
        
        return navigationIntermediateController
    }
    
    func setupUI() {
        passedInformationLabel.text = passedInformation
    }
}

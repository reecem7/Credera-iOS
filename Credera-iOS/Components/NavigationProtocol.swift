//
//  NavigationProtocol.swift
//  Credera-iOS
//
//  Created by Zachary Slayter on 3/12/18.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationProtocol where Self: UIViewController {
    
    static var storyboardName: String { get }   // This is the name of the storyboard file
    static var viewControllerID: String { get } // This is the "storyboardID" for the viewController as defined in the storyboard.
    static var storyboardBundle: Bundle { get } // This is the bundle that the storyboard file is in
    
    // These are generic placeholders for the model type and delegate type
    // They are defined in each view controller
    associatedtype Model        // Contains any data needed from previous view controllers
    associatedtype Delegate     // Defines the methods for communication with previous view controllers
    
    // This function is used to generate an instance and
    // assign necessary variables on the view controller
    static func getInstance(model: Model, delegate: Delegate?) -> Self
    
}

extension NavigationProtocol where Self: UIViewController {
    // This assumes the storyboard is stored in the same bundle
    // as the view controller
    public static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }
    
    public static func getInstance() -> Self {
        
        guard let viewController = UIStoryboard(name: self.storyboardName, bundle: self.storyboardBundle).instantiateViewController(withIdentifier: self.viewControllerID) as? Self else {
            fatalError("Error instantiating view controller: " + self.viewControllerID)
        }
        
        return viewController
    }
    
}

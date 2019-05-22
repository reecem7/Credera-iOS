//
//  NavigationHelper.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationHelper {
    
    // These are generic placeholders for the passed data type and return type
    // They are defined in each view controller
    associatedtype PassedInfo
    associatedtype SpecificViewController
    
    // This is the name of the storyboard file
    static var storyboardName: String { get }
    
    // This is the "storyboardID" for the viewController as defined
    // in the storyboard.
    static var viewControllerID: String { get }
    
    static var storyboardBundle: Bundle { get }
    
    static func getInstance(passedInformation: PassedInfo, delegate: NavigationCompletedProtocol?) -> SpecificViewController
    
}

extension NavigationHelper where Self: UIViewController {
    public static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }
    
    public static func getInstance() -> SpecificViewController {
        
        guard let viewController = UIStoryboard(name: self.storyboardName, bundle: self.storyboardBundle).instantiateViewController(withIdentifier: self.viewControllerID) as? SpecificViewController else {
            fatalError("Error instantiating view controller: " + self.viewControllerID)
        }
        
        return viewController
    }
}

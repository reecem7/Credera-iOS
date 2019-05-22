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
    
    // This is a generic placeholder for the passed data type and is defined in each view controller
    associatedtype PassedInfo
    
    // This is the name of the storyboard file
    static var storyboardName: String { get }
    
    // This is the "storyboardID" for the viewController as defined
    // in the storyboard.
    static var viewControllerID: String { get }
    
    static var storyboardBundle: Bundle { get }
    
    static func getInstance(passedInformation: PassedInfo, delegate: NavigationCompletedProtocol?) -> UIViewController
    
}

extension NavigationHelper where Self: UIViewController {
    public static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }
    
    public static func getInstance() -> UIViewController {
        return UIStoryboard(name: self.storyboardName, bundle: self.storyboardBundle).instantiateViewController(withIdentifier: self.viewControllerID) as UIViewController
    }
}

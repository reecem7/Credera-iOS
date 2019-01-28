//
//  Coordinator.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 1/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import UIKit

public protocol Coordinator : class {
    
    var childCoordinators: [Coordinator] { get set }
    
    // All coordinators will be initialised with a navigation controller
    init(navigationController: UINavigationController)
    
    func start()
}

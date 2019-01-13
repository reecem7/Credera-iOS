//
//  MainSinglePageManager.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 1/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

public protocol MainSinglePageProtocol {
    var mainPageText: String? {get set}
}

public class MainSinglePageManager: MainSinglePageProtocol {
    public var mainPageText: String?
    
    public init() {
        mainPageText = "Dependency Manager has loaded REAL dependencies"
    }
}


//
//  DependencyManager.swift
//  Credera-iOS
//
//  Created by Natasha Solanki on 1/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import UIKit

public class DependencyManager {
    
    static var shared: DependencyManager = DependencyManager()
    public var useMockData: Bool = ProcessInfo.processInfo.arguments.contains("inTesting")
    
    //default to load real dependencies
    public var MainPageManager: MainSinglePageProtocol = MainSinglePageManager()
    
    private init() {
        if useMockData{
            loadMockDependencies()
        } else {
            loadRealDependencies()
        }
    }
    
    private func loadMockDependencies() {
        MainPageManager = MainSinglePageManagerMock()
    }
    
    private func loadRealDependencies() {
        MainPageManager = MainSinglePageManager()
    }
}

//
//  User.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct User {
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var address: String = ""
    var phone: String = ""
    var website: String = ""
    
    init() {}
    
    func isValid() -> Bool {
        return id > 0
    }
}

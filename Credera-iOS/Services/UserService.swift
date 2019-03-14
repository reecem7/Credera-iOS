//
//  UserService.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol UserService {
    
    // TODO: Figure out parameters needed for Create, Update and Delete functions...
    func create() -> Promise<User>
    func getAllUsers() -> Promise<[User]>
    func getUserByUsername(username: String) -> Promise<User>
    func getUserByEmail(email: String) -> Promise<User>
    func update(id: Int) -> Promise<User>
    func delete(id: Int) -> Promise<User>
    
}

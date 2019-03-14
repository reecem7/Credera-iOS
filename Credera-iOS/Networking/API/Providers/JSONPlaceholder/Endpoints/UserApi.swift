//
//  UserApi.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol UserApi {
    
    func create() -> Promise<[UserApiModel]>
    func read() -> Promise<[UserApiModel]>
    func readByUsername(username: String) -> Promise<[UserApiModel]>
    func readByEmail(email: String) -> Promise<[UserApiModel]>
    func update(id: Int) -> Promise<[UserApiModel]>
    func delete(id: Int) -> Promise<[UserApiModel]>
    
}

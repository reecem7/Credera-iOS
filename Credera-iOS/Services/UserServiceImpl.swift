//
//  UserServiceImpl.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

class UserServiceImpl: UserService {
    
    let userApi: UserApi
    
    init(userApi: UserApi) {
        self.userApi = userApi
    }
    
    func create() -> Promise<User> {
        return Promise({ () -> User in
            return User()
        })
    }
    
    func getAllUsers() -> Promise<[User]> {
        let apiResponse: Promise<[UserApiModel]> = userApi.read()
        
        return apiResponse.then { (users) -> [User] in
            let mapped = users.map({ (apiModel) -> User in
                var user = User()
                
                user.id = apiModel.id ?? -1
                user.username = apiModel.username ?? ""
                user.email = apiModel.email ?? ""
                
                let address = apiModel.address
                let formattedAddress = "\(address?.street ?? ""), \(address?.city ?? "")"
                
                user.address = formattedAddress
                
                return user
            })
            
            return mapped
        }
    }
    
    func getUserByUsername(username: String) -> Promise<User> {
        return Promise({ () -> User in
            return User()
        })
    }
    
    func getUserByEmail(email: String) -> Promise<User> {
        return Promise({ () -> User in
            return User()
        })
    }
    
    func update(userId: Int) -> Promise<User> {
        return Promise({ () -> User in
            return User()
        })
    }
    
    func delete(userId: Int) -> Promise<User> {
        return Promise({ () -> User in
            return User()
        })
    }
}

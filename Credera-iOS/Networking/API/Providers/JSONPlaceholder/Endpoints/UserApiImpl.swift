//
//  UserApiImpl.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

class UserApiImpl: UserApi {
    
    private let caller: RequestCaller
    
    init(caller: RequestCaller) {
        self.caller = caller
    }
    
    func create() -> Promise<[UserApiModel]> {
        let request = UsersApiRequest(httpMethod: HttpMethod.post)
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    func read() -> Promise<[UserApiModel]> {
        let request = reqRead()
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    func readByUsername(username: String) -> Promise<[UserApiModel]> {
        let request = reqRead(username: username)
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    func readByEmail(email: String) -> Promise<[UserApiModel]> {
        let request = reqRead(email: email)
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    func update(id: Int) -> Promise<[UserApiModel]> {
        let request = UsersApiRequest(httpMethod: HttpMethod.put)
        request.query = ["id": id]
        
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    func delete(id: Int) -> Promise<[UserApiModel]> {
        let request = UsersApiRequest(httpMethod: HttpMethod.delete)
        request.query = ["id": id]
        
        let response: Promise<[UserApiModel]> = caller.call(request)
        
        return response
    }
    
    // region Request Helpers
    
    private func reqRead() -> UsersApiRequest {
        return UsersApiRequest(httpMethod: HttpMethod.get)
    }
    
    private func reqRead(email: String) -> UsersApiRequest {
        let request = reqRead()
        request.query = ["email": email]
        
        return request
    }
    
    private func reqRead(username: String) -> UsersApiRequest {
        let request = reqRead()
        request.query = ["username": username]
        
        return request
    }
    
    // endregion
}

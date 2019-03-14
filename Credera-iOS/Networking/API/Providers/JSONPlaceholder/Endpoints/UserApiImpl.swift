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
    
    private let baseUrl: String = ApiProviderConfig.baseUrl
    private let defaultPath: String = "users"

    private var caller: RequestCaller
    
    init(caller: RequestCaller) {
        self.caller = caller
    }
    
    func create() -> Promise<[UserApiModel]> {
        let request = HttpRequest(httpMethod: HttpMethod.post, path: defaultPath, baseUrl: baseUrl)
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func read() -> Promise<[UserApiModel]> {
        let request = reqRead()
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func readByUsername(username: String) -> Promise<[UserApiModel]> {
        let request = reqRead(username: username)
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func readByEmail(email: String) -> Promise<[UserApiModel]> {
        let request = reqRead(email: email)
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func update(id: Int) -> Promise<[UserApiModel]> {
        var request = HttpRequest(httpMethod: HttpMethod.put, path: defaultPath, baseUrl: baseUrl)
        request.query = ["id": id]
        
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    func delete(id: Int) -> Promise<[UserApiModel]> {
        var request = HttpRequest(httpMethod: HttpMethod.delete, path: defaultPath, baseUrl: baseUrl)
        request.query = ["id": id]
        
        let response: Promise<[UserApiModel]> = caller.call(request.asURLRequest())
        
        return response
    }
    
    // region Request Helpers
    
    private func reqRead() -> HttpRequest {
        return HttpRequest(httpMethod: HttpMethod.get, path: defaultPath, baseUrl: baseUrl)
    }
    
    private func reqRead(email: String) -> HttpRequest {
        var request = reqRead()
        request.query = ["email": email]
        
        return request
    }
    
    private func reqRead(username: String) -> HttpRequest {
        var request = reqRead()
        request.query = ["username": username]
        
        return request
    }
    
    // endregion
}

//
//  UsersRequest.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/20/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

/*
 * Example of subclassing `HttpRequest` class to make constructing requests easier, less repetitive and/or to override
 * methods from it.
 */
class UsersApiRequest: HttpRequest {
    
    init(httpMethod: HttpMethod) {
        super.init(httpMethod: httpMethod, path: "users", baseUrl: ApiProviderConfig.baseUrl)
    }
    
    override func isValid() -> Bool {
        return super.isValid() && self.httpMethod != HttpMethod.patch
    }
}

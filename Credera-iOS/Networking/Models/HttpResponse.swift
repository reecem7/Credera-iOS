//
//  HttpResponse.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

public struct HttpResponse {
    
    public var statusCode: Int
    public var data: Data?
    
    init(statusCode: Int, data: Data?) {
        self.statusCode = statusCode
        self.data = data
    }
}

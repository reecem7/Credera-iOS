//
//  URLRequest+Extension.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/13/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

extension URLRequest {
    init(_ url: URL, httpMethod: String?) {
        self.init(url: url)
        self.httpMethod = httpMethod
    }
}

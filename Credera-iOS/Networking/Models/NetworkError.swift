//
//  NetworkError.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/19/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case DecodeJson
    case DecodeXml
    case InvalidRequest
    case Unknown
    case UnknownResponse
}

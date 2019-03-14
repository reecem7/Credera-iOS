//
//  HttpRequest.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/12/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

public struct HttpRequestDefaults {
    
    public var baseUrl: String?
    
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
}

public struct HttpRequest {
    
    public static var defaults: HttpRequestDefaults = HttpRequestDefaults()
    
    var baseUrl: String
    var httpMethod: HttpMethod
    var path: String
    var query: [String:Any]?
    var payload: [String:Any?]?
    var headers: [String:String]?
    
    public init(
        httpMethod: HttpMethod,
        path: String,
        baseUrl: String = defaults.baseUrl ?? "",
        query: [String:Any]? = nil,
        payload: [String:Any?]? = nil,
        headers: [String:String]? = nil) {
        
        self.baseUrl = baseUrl
        self.httpMethod = httpMethod
        self.path = path
        self.query = query
        self.payload = payload
        self.headers = headers
    }
}

extension HttpRequest {
    
    public func asURLRequest() -> URLRequest {
        
        let url = "\(baseUrl)/\(path)"
        
        var components = URLComponents(string: url)
        if let qItems = query {
            let queryItems:[URLQueryItem] = qItems.reduce([], { (result, current) -> [URLQueryItem] in
                var _result = result
                _result.append(URLQueryItem(name: current.key, value: "\(current.value)"))
                return _result
            })
            components?.queryItems = queryItems
        }
        
        var request = URLRequest(url: (components?.url!)!)
        request.httpMethod = httpMethod.rawValue
        
        if payload != nil,
            let payloadData = try? JSONSerialization
                .data(withJSONObject: payload!,
                      options: []) {
            request.httpBody = payloadData
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        headers?
            .enumerated()
            .forEach {
                request.addValue($0.element.value,
                                 forHTTPHeaderField: $0.element.key)
        }
        
        return request
    }
}

//
//  HttpRequest.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/12/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

public struct HttpRequestDefaults {
    
    public let baseUrl: String
    public let headers: [String: String]?
    
    public init(_ baseUrl: String, headers: [String: String]? = nil) {
        self.baseUrl = baseUrl
        self.headers = headers
    }
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

public class HttpRequest {
    
    var httpMethod: HttpMethod
    var path: String
    var baseUrl: String
    var query: [String: Any]?
    var payload: Encodable?
    var headers: [String: String]?
    
    public init(
        httpMethod: HttpMethod,
        path: String,
        baseUrl: String,
        query: [String: Any]? = nil,
        payload: Encodable? = nil,
        headers: [String: String]? = nil) {
        
        self.httpMethod = httpMethod
        self.path = path
        self.baseUrl = baseUrl
        self.query = query
        self.payload = payload
        self.headers = headers
    }
    
    public init(httpMethod: HttpMethod,
                path: String,
                requestDefaults: HttpRequestDefaults) {
        
        self.httpMethod = httpMethod
        self.path = path
        self.baseUrl = requestDefaults.baseUrl
        self.headers = requestDefaults.headers
    }
    
    func isValid() -> Bool {
        return !baseUrl.isEmpty && !baseUrl.hasSuffix("/") && (baseUrl.hasPrefix("https://") || baseUrl.hasPrefix("http://"))
    }
}

extension HttpRequest {
    
    public func asURLRequest() -> URLRequest {
        
        var components = URLComponents(string: urlWithPath())
        components?.queryItems = queryItems()
        
        var request = URLRequest(url: (components?.url!)!)
        request.httpMethod = httpMethod.rawValue
        
        if payload != nil, let payloadData: Data = try? JSONSerialization.data(withJSONObject: payload!, options: []) {
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
    
    public func urlWithPath() -> String {
        return "\(baseUrl)/\(path)"
    }
    
    public func queryItems() -> [URLQueryItem]? {
        if let qItems = query {
            let queryItems: [URLQueryItem] = qItems.reduce([], { (result, current) -> [URLQueryItem] in
                var qResult = result
                qResult.append(URLQueryItem(name: current.key, value: "\(current.value)"))
                return qResult
            })
            
            return queryItems
        } else {
            return nil
        }
    }
}

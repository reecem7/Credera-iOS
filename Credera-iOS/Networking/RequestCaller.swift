//
//  RequestCaller.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/12/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

public class RequestCaller {
    
    private lazy var decoder = JSONDecoder()
    private var urlSession: URLSession
    
    public init(config: URLSessionConfiguration) {
        urlSession = URLSession(configuration: config)
    }
    
    public convenience init() {
        self.init(config: URLSessionConfiguration.default)
    }
    
    public func call<V: Decodable>(_ request: URLRequest) -> Promise<V> {
        return Promise<V>(on: .global(qos: .background), { (fullfill, reject) in
            self.urlSession.dataTask(with: request) { (data, urlResponse, protocolError) in
                // TODO: Fix this, not sure what error this holds...
                if let protocolError = protocolError {
                    reject(protocolError)
                    return
                }
                
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    
                    do {
                        let responseData = data ?? Data()
                        if (200...399).contains(statusCode) {
                            let result = try self.decoder.decode(V.self, from: responseData)
                            
                            fullfill(result)
                        } else {
                            // TODO: Fix this, need a better error to return
                            reject(NSError(domain: "RequestCaller.call", code: -1, userInfo: nil))
                        }
                    } catch let decodeError {
                        reject(decodeError)
                    }
                } else {
                    // TODO: Fix this, need a better error to return
                    reject(NSError(domain: "RequestCaller.call", code: -1, userInfo: nil))
                }
            }.resume()
        })
    }
}

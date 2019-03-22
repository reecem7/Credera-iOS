//
//  PhotosApiImpl.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/20/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

/*
 *
 */
class PhotosApiImpl: PhotosApi {

    private let requestDefaults: HttpRequestDefaults = HttpRequestDefaults(ApiProviderConfig.baseUrl, headers: ["Accept": "application/json"])
    private let caller: RequestCaller
    
    init(caller: RequestCaller) {
        self.caller = caller
    }

    func read() -> Promise<[PhotoApiModel]> {
        let request = HttpRequest(httpMethod: HttpMethod.get, path: "photos", requestDefaults: requestDefaults)
        let response: Promise<[PhotoApiModel]> = caller.call(request)
        
        return response
    }

    func read(id: Int) -> Promise<[PhotoApiModel]> {
        
        let path = "photos/\(id)"
        let request = HttpRequest(httpMethod: HttpMethod.get, path: path, requestDefaults: requestDefaults)
        let response: Promise<[PhotoApiModel]> = caller.call(request)
        
        return response
    }

    func readByAlbumId(id: Int) -> Promise<[PhotoApiModel]> {
        let request = HttpRequest(httpMethod: HttpMethod.get, path: "photos", requestDefaults: requestDefaults)
        request.query = ["albumId": id]
        
        let response: Promise<[PhotoApiModel]> = caller.call(request)
        
        return response
    }

}

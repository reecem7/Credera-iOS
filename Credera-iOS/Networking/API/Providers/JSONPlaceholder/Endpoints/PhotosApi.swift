//
//  PhotosApi.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/20/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation
import Promises

protocol PhotosApi {
    
    func read() -> Promise<[PhotoApiModel]>
    func read(id: Int) -> Promise<[PhotoApiModel]>
    func readByAlbumId(id: Int) -> Promise<[PhotoApiModel]>
    
}

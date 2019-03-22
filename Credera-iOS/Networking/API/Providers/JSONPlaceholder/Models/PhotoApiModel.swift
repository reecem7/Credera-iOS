//
//  PhotoApiModel.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/20/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct PhotoApiModel: Codable {
    let id: Int?
    let albumId: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}

//
//  UserApiModel.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct UserApiModel: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let address: AddressApiModel?
    let phone: String?
    let website: String?
}

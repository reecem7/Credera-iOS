//
//  AddressApiModel.swift
//  Credera-iOS
//
//  Created by Fernando Berrios on 3/14/19.
//  Copyright © 2019 Credera. All rights reserved.
//

import Foundation

struct AddressApiModel: Decodable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: GeoApiModel?
}

struct GeoApiModel: Decodable {
    let lat: String?
    let lng: String?
}

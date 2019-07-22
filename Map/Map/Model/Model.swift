//
//  Model.swift
//  Map
//
//  Created by Adakhanau on 22/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation
import MapKit

struct Courses: Decodable {
    var branches: [Branches]?
    var contacts: [Contacts]?
    var description: String?
    var name: String?
    var rating: Float?
}

struct Branches: Decodable {
    var address: String?
    var location: Location?
    var phone: String?
}

struct Location: Decodable {
    var latitude: String?
    var longitude: String?
}

struct Contacts: Decodable {
    var data: String?
}


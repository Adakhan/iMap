//
//  Model.swift
//  Map
//
//  Created by Adakhanau on 22/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation

struct Places {
    var courses: [Courses]
}

struct Courses {
    var branches: [Branches]
    var contacts: [Contacts]
    var description: String?
    var name: String?
    var rating: Float?
}

struct Branches {
    var address: String?
    var location: Location
    var phone: String?
}

struct Location {
    var latitude: String?
    var longitude: String?
}

struct Contacts: Codable {
    var data: String?
}


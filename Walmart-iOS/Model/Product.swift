//
//  Product.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Product: Mappable {
    
    var id: String?
    var name: String?
    var originPrice: Double?
    var currentPrice: Double?
    var rating: Double?
    var photo: String?
    var ship: String?
    var quantity: Int = 0
    var isSelected: Bool = false
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        originPrice <- map["originPrice"]
        currentPrice <- map["currentPrice"]
        rating <- map["rating"]
        photo <- map["photo"]
        ship <- map["ship"]
    }
}

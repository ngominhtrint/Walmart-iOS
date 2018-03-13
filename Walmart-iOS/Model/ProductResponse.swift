//
//  ProductResponse.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ProductResponse: Mappable {
    
    var products: [Product]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        products <- map["products"]
    }
}

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
    var subTotal: Double = 0.0
    var total: Double = 0.0
    var totalItem: Int = 0
    
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
    
    init(id: String, name: String, originPrice: Double, currentPrice: Double, rating: Double, photo: String, ship: String, quantity: Int, isSelected: Bool) {
        self.id = id
        self.name = name
        self.originPrice = originPrice
        self.currentPrice = currentPrice
        self.rating = rating
        self.photo = photo
        self.ship = ship
        self.quantity = quantity
        self.isSelected = isSelected
    }
    
    init(subTotal: Double, total: Double, totalItem: Int) {
        self.init(id: "", name: "", originPrice: 0.0, currentPrice: 0.0, rating: 0.0, photo: "", ship: "", quantity: 0, isSelected: false)
        self.subTotal = subTotal
        self.total = total
        self.totalItem = totalItem
    }
    
    static func initState() -> Product {
        return Product.init(id: "", name: "", originPrice: 0.0, currentPrice: 0.0, rating: 0.0, photo: "", ship: "", quantity: 0, isSelected: false)
    }
}

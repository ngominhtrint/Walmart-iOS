//
//  Product.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: NSObject, Mappable, NSCoding {
    
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
    
    required init?(coder decoder: NSCoder) {
        self.id = decoder.decodeObject(forKey: "id") as? String
        self.name = decoder.decodeObject(forKey: "name") as? String
        self.originPrice = decoder.decodeObject(forKey: "originPrice") as? Double
        self.currentPrice = decoder.decodeObject(forKey: "currentPrice") as? Double
        self.rating = decoder.decodeObject(forKey: "rating") as? Double
        self.photo = decoder.decodeObject(forKey: "photo") as? String
        self.ship = decoder.decodeObject(forKey: "ship") as? String
        if let quantity = decoder.decodeObject(forKey: "quantity") as? Int {
            self.quantity = quantity
        }
        if let isSelected = decoder.decodeObject(forKey: "isSelected") as? Bool {
            self.isSelected = isSelected
        }
        if let subTotal = decoder.decodeObject(forKey: "subTotal") as? Double {
            self.subTotal = subTotal
        }
        if let total = decoder.decodeObject(forKey: "total") as? Double {
            self.total = total
        }
        if let totalItem = decoder.decodeObject(forKey: "totalItem") as? Int {
            self.totalItem = totalItem
        }
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(originPrice, forKey: "originPrice")
        coder.encode(currentPrice, forKey: "currentPrice")
        coder.encode(rating, forKey: "rating")
        coder.encode(photo, forKey: "photo")
        coder.encode(ship, forKey: "ship")
        coder.encode(quantity, forKey: "quantity")
        coder.encode(isSelected, forKey: "isSelected")
        coder.encode(subTotal, forKey: "subTotal")
        coder.encode(total, forKey: "total")
        coder.encode(totalItem, forKey: "totalItem")
    }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
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
    
    convenience init(subTotal: Double, total: Double, totalItem: Int) {
        self.init(id: "", name: "", originPrice: 0.0, currentPrice: 0.0, rating: 0.0, photo: "", ship: "", quantity: 0, isSelected: false)
        self.subTotal = subTotal
        self.total = total
        self.totalItem = totalItem
    }
    
    static func initState() -> Product {
        return Product.init(id: "", name: "", originPrice: 0.0, currentPrice: 0.0, rating: 0.0, photo: "", ship: "", quantity: 0, isSelected: false)
    }
}

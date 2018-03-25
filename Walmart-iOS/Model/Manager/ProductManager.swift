//
//  ProductManager.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/25/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation

class ProductManager {
    
    static let shared: ProductManager = ProductManager()
    
    init() {
        load()
    }
    
    var products: [Product] = [] {
        didSet {
            save()
        }
    }
    
    var isReset: Bool {
        set {
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: newValue as Any)
            UserDefaults.standard.set(encodedData, forKey: "isReset")
            UserDefaults.standard.synchronize()
        }
        
        get {
            if let decodeData: Data = UserDefaults.standard.object(forKey: "isReset") as? Data {
                if let isReset = NSKeyedUnarchiver.unarchiveObject(with: decodeData) as? Bool {
                    return isReset
                }
            }
            return false
        }
    }
    
    func save() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: products as Any)
        UserDefaults.standard.set(encodedData, forKey: "products")
        UserDefaults.standard.synchronize()
    }
    
    func save(newProducts: [Product]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: newProducts as Any)
        UserDefaults.standard.set(encodedData, forKey: "products")
        UserDefaults.standard.synchronize()
    }
    
    func load() {
        if let decodeData: Data = UserDefaults.standard.object(forKey: "products") as? Data {
            if let products = NSKeyedUnarchiver.unarchiveObject(with: decodeData) as? [Product] {
                self.products = products
            }
        }
    }
    
    func loadCartItems() -> [Product] {
        var filterProducts = products.filter { $0.isSelected }
        if filterProducts.count > 0 {
            let totalItems = filterProducts.reduce(0) { $0 + $1.quantity }
            let totalAmount = filterProducts.reduce(0) { $0 + Double($1.quantity) * $1.currentPrice! }
            let headerItem = Product(subTotal: 0.0, total: totalAmount, totalItem: totalItems)
            let footerItem = Product(subTotal: 0.0, total: totalAmount, totalItem: totalItems)
            filterProducts.insert(headerItem, at: 0)
            filterProducts.insert(footerItem, at: filterProducts.count)
        }
        return filterProducts
    }
}

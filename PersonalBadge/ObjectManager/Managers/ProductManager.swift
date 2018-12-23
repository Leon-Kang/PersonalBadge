//
//  ProductManager.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/22.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import RealmSwift

class ProductManager: NSObject {
    static let defaultManager = ProductManager()
    let realm = try! Realm.init()
    
    var _products: Array<Product> = Array()
    var products: Array<Product> {
        set(newProducts) {
            _products = newProducts
        }
        get {
            _products = realm.objects(Product.self).copy() as! Array<Product>
            return _products
        }
    }
}

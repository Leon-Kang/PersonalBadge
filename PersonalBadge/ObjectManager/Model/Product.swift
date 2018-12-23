//
//  Production.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/22.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import RealmSwift

class Product: Object {
    dynamic var productId = -1
    dynamic var name: String = ""
    
    dynamic var imageName: String = ""
    dynamic var tag: String = "All"
    
    dynamic var productiveTime: Date = Date.init()
    dynamic var expirationTime: Date? = nil
    dynamic var expiratioDate: Date? = nil
}

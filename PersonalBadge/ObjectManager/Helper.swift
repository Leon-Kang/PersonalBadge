//
//  Helper.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/22.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func stringValue() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = kDateFormatter
        return dateFormatter.string(from: self)
    }
}


extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = kDateFormatter
        return dateFormatter.date(from: self)!
    }
}


extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UINavigationBar {
    func clearBackground() {
        self.backgroundColor = UIColor.clear
        self.isTranslucent = true
        self.setBackgroundImage(UIImage.imageWithColor(color: UIColor.clear), for: .default)
        self.shadowImage = UIImage.imageWithColor(color: UIColor.clear)
    }
    
    func defaultNaivationBar() {
        self.backgroundColor = UIColor.white
        self.isTranslucent = true
        self.setBackgroundImage(nil, for: .default)
        self.shadowImage = nil
    }
}

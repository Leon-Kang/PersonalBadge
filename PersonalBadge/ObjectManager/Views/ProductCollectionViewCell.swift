//
//  ProductCollectionViewCell.swift
//  ObjectManager
//
//  Created by 康梁 on 2017/8/23.
//  Copyright © 2017年 LeonKang. All rights reserved.
//

import UIKit

let kProductCellIdentifier = "productCellIdentifier"

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func select(_ sender: Any?) {
        
    }
}

//
//  EventCollectionViewCell.swift
//  PersonalBadge
//
//  Created by 康梁 on 2018/12/23.
//  Copyright © 2018 LeonKang. All rights reserved.
//

import UIKit

let kEventCellIdentifier = "kEventCollectionViewCellIdentifier"

class EventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unlockTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

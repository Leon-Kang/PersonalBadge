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
    
    public var cellSizeStyle : CellSizeStyle? {
        didSet (newCellSizeStyle) {
            if newCellSizeStyle != cellSizeStyle {
                refreshUI()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - UI
    func setupUI() {
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 8
        self.contentView.clipsToBounds = true
        
        #if DEBUG
        contentView.backgroundColor = UIColor.red
        badgeImageView.backgroundColor = UIColor.blue
        #endif
    }
    
    func refreshUI() {
        
    }

}

//
//  SettingViewCell.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/12.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class SettingViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.borderColor = UIColor.notPrimary.cgColor
        contentView.layer.borderWidth = 0.3
    }
    
}

//
//  TableViewCell.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/09.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func dataSet(displayText:String) {
        self.nameLabel.text = displayText
    }
    
}

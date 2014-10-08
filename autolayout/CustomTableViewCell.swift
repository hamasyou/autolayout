//
//  CustomTableViewCell.swift
//  autolayout
//
//  Created by 濱田 章吾 on 2014/10/08.
//  Copyright (c) 2014年 hamasyou. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var preferredView: UIView!
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var labelView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

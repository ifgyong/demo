//
//  MusicCell.swift
//  Swift_rx
//
//  Created by Charlie on 2019/4/29.
//  Copyright © 2019年 www.fgyong.cn. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

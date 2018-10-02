//
//  BlueTableViewCell.swift
//  BlueTracker
//
//  Created by Junghoon Lee on 10/2/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit

class BlueTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

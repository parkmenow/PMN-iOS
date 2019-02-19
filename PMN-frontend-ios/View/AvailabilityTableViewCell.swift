//
//  AvailabilityTableViewCell.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/20.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class AvailabilityTableViewCell: UITableViewCell {

    @IBOutlet weak var slotID: UILabel!
    @IBOutlet weak var spotID: UILabel!
    @IBOutlet weak var strtTime: UILabel!
    @IBOutlet weak var endTme: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var availability: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

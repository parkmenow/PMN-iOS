//
//  SlotTableViewCell.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/20.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class SlotTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var noofSlots: UILabel!
    @IBOutlet weak var spotID: UILabel!
    @IBOutlet weak var propertyID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

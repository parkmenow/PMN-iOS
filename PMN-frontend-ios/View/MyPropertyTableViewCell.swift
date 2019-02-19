//
//  MyPropertyTableViewCell.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/20.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class MyPropertyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var propertyID: UILabel!
    @IBOutlet weak var noOfSlot: UILabel!
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var pincode: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
}

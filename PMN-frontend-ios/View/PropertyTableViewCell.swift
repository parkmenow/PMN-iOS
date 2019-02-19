//
//  PropertyTableViewCell.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/19.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    
    
  
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var slotID: UILabel!    
    @IBOutlet weak var spotImage: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

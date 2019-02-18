//
//  property.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

struct property : Codable  {
    let line1 : String
    let line2 : String
    let pincode : String
    let lat : Float64
    let long : Float64
    let owner_id : String
    
    init(line1 : String,line2 : String,pincode : String,lat : Float64,long : Float64,owner_id : String) {
        self.line1 = line1
        self.line2 = line2
        self.pincode = pincode
        self.lat = lat
        self.long = long
        self.owner_id = owner_id
    }
}

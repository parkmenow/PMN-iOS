//
//  property.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

struct property : Codable  {
    let ID : Int
    let Line1 : String
    let Line2 : String
    let Pincode : String
    let Lat : Double
    let Long : Double
    let Spots : [Spot]
    let owner_id : Int
    
    init( ID : Int,Line1 : String,Line2 : String,Pincode : String,Lat : Double,Long : Double, Spots : [Spot],owner_id : Int)
    {
        self.ID = ID
        self.Line1 = Line1
        self.Line2 = Line2
        self.Pincode = Pincode
        self.Lat = Lat
        self.Long = Long
        self.Spots = Spots
        self.owner_id = owner_id
    }
  
}

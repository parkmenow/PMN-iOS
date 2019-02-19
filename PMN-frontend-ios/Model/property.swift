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
    let lat : Double
    let long : Double
    let Spots : [Spot]
    let OwnerID : Int
    
    init( ID : Int,Line1 : String,Line2 : String,Pincode : String,lat : Double,long : Double, Spots : [Spot],OwnerID : Int)
    {
        self.ID = ID
        self.Line1 = Line1
        self.Line2 = Line2
        self.Pincode = Pincode
        self.lat = lat
        self.long = long
        self.Spots = Spots
        self.OwnerID = OwnerID
    }
  
}


struct PropertiesArr : Codable {
    var results : [property]
}

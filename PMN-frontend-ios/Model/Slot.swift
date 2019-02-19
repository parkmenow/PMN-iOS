//
//  Slot.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/19.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation


struct slot : Codable {
    var ID : Int
    var StartTime: String
    var EndTime: String
    var Price: Int
    var SpotID: Int
    var Available: Bool
    
    init(ID : Int,StartTime: String,EndTime: String,Price: Int,SpotID: Int,Available: Bool){
        self.ID = ID
        self.StartTime = StartTime
        self.EndTime = EndTime
        self.Price = Price
        self.SpotID = SpotID
        self.Available = Available
    }
}

//
//  Spot.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/19.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

struct Spot: Codable {
    var ID: Int
//    var Type: Int
    var ImageURL: String
    var Description: String
    var Slots : [slot]
    var PropertyID : Int
    
    init(ID: Int , /*vType: Int ,*/ Description: String , ImageURL: String , Slots : [slot],PropertyID : Int){
        self.ID = ID
//        self.vType = vType
        self.ImageURL = ImageURL
        self.Description = Description
        self.Slots = Slots
        self.PropertyID = PropertyID
    }
    init(){
        self.ID = 0
//        self.vType = 0
        self.ImageURL = ""
        self.Description = ""
        self.Slots = []
        self.PropertyID = 0
    }
}

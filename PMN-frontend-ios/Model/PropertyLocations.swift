//
//  PropertyLocations.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

class ParkingLocation: NSObject {
    let name : String
    let location : CLLocationCoordinate2D
    let zoom : Float
    
    init(name : String,location : CLLocationCoordinate2D,zoom : Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
        
    }
}

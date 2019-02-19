//
//  globalData.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

enum globalData {
    static var google_map_key : String = "AIzaSyAzesTC93HNwqUfAS2ONoc2_LHygrLQ4qU"
    static var ip : String = "http://192.168.1.114:8080"
    static var loginURL : String = "http://192.168.1.114:8080"+"/login"
    static var registerURL : String = "http://192.168.1.114:8080"+"/api/v1/signup"
    static var dashBoardURL : String = "http://192.168.1.114:8080"+"/api/v1/dashboard/1"
    static var accessToken = ""
    static var listingURL = "http://192.168.1.114:8080"+"/api/v1/mylisting"
    static let stripePublicKey = "pk_test_Mv6f0boaChFBAmBOiuiwIgLs"
}

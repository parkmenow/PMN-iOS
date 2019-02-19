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
    static var ip : String = "https://pmn-api-1-staging-v1.herokuapp.com"
    static var loginURL : String = "https://pmn-api-1-staging-v1.herokuapp.com"+"/login"
    static var registerURL : String = "https://pmn-api-1-staging-v1.herokuapp.com"+"/signup"
    static var dashBoardURL : String = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/1/"
    static var accessToken = ""
    static var listingURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/mylistings"
    static let stripePublicKey = "pk_test_Mv6f0boaChFBAmBOiuiwIgLs"
    static let parkMeURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/parkmenow"
    static let chargeURL = ""
}


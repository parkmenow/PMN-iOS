//
//  globalData.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

enum globalData2 {
    static var google_map_key : String = "AIzaSyAzesTC93HNwqUfAS2ONoc2_LHygrLQ4qU"
    static var ip : String = "https://pmn-api-1-staging-v1.herokuapp.com"
    static var loginURL : String = "https://pmn-api-1-staging-v1.herokuapp.com"+"/login"
    static var registerURL : String = "https://pmn-api-1-staging-v1.herokuapp.com"+"/signup"
    static var dashBoardURL : String = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/1/"
    static var accessToken = ""
    static var listingURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/mylistings"
    static let stripePublicKey = "pk_test_Mv6f0boaChFBAmBOiuiwIgLs"
    static let parkMeURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/parkmenow"
    static let paymentURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/paybywallet"
    static let chargeURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/3/payment"
}
enum globalData {
    static var google_map_key : String = "AIzaSyAzesTC93HNwqUfAS2ONoc2_LHygrLQ4qU"
    static var ip : String = "http://192.168.10.78:8080"
    static var loginURL : String = "http://192.168.10.78:8080"+"/login"
    static var registerURL : String = "http://192.168.10.78:8080"+"/signup"
    static var dashBoardURL : String = "http://192.168.10.78:8080/dashboard/1/"
    static var accessToken = ""
    static var listingURL = "http://192.168.10.78:8080/dashboard/3/mylistings"
    static let stripePublicKey = "pk_test_Mv6f0boaChFBAmBOiuiwIgLs"
    static let parkMeURL = "http://192.168.10.78:8080/dashboard/3/parkmenow"
    static let paymentURL = "http://192.168.10.78:8080/dashboard/3/paybywallet"
    static let chargeURL = "http://192.168.10.78:8080/dashboard/3/payment"
}

extension String {
    
    func sliceByCharacter(from: Character, to: Character) -> String? {
        let fromIndex = self.index(self.index(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.index(of: to)!, offsetBy: -1)
        return String(self[fromIndex...toIndex])
    }
    
    func sliceByString(from:String, to:String) -> String? {
        //From - startIndex
        var range = self.range(of: from)
        let subString = String(self[range!.upperBound...])
        
        //To - endIndex
        range = subString.range(of: to)
        return String(subString[..<range!.lowerBound])
    }
    
}


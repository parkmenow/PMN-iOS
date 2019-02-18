//
//  loginUser.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

struct loginUser : Codable  {
    let u_name: String
    let password : String
    
    init(name: String, password: String) {
        self.u_name = name
        self.password = password
    }
}

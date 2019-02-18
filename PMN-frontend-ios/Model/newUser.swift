//
//  newUser.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import Foundation

struct newUser : Codable  {
    let fname : String
    let lname : String
    let uname : String
    let email : String
    let phoneno : String
    let password : String
    
    init(fname : String,lname : String,uname : String,email : String,phoneno : String,password : String) {
        self.fname = fname
        self.lname = lname
        self.uname = uname
        self.email = email
        self.phoneno = phoneno
        self.password = password
    }
}

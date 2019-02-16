//
//  LoginViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginURL    : String = ""
    var accessToken : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let nameText = name.text ?? ""
        let passwordText = password.text ?? ""
        
        if checkPassword(name: nameText, password: passwordText) {
            
        }
        
    }
    
    func checkPassword(name : String , password : String) -> Bool {
        //Start SVD Progress
        print("In Check PAssword")
        return false
    }
    
    func getLoginToken(name: String, password: String) {
        
        Alamofire.request(loginURL, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Get response from backend ")
                    let priceJSON : JSON = JSON(response.result.value!)
                    self.accessToken = priceJSON.string ?? ""
                }
        
        }
    }
    
}

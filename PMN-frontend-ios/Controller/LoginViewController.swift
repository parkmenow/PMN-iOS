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
    
    var loginURL    : String = "https://pokeapi.co/api/v2/ability/"
    var accessToken : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let nameText = name.text ?? ""
        let passwordText = password.text ?? ""
        
//        if checkPassword(name: nameText, password: passwordText) {
//            let vc = DashboardViewController(input: .init(name: self.name.text))
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
    
    
    
    
    // MARK:- Password Check
    
    func checkPassword(name : String , password : String) -> Bool {
        //Start SVD Progress
        print("In Check PAssword")
//        getLoginToken(name: name, password: password)
        //make call to backend with name and password and
        return true
    }
    
    
    //MARK:- Networking
    
    func getLoginToken(name: String, password: String) {
    
        Alamofire.request(loginURL, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Get response from backend for login")
                    let tokenJSON : JSON = JSON(response.result.value!)
                    print(tokenJSON)
//                    self.accessToken = tokenJSON.string ?? ""
                }
                
//                if response.response?.statusCode == 200 {
//                    return true
//                }
        
        }
    }
    
}

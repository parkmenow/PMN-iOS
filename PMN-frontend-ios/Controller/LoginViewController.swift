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
    
    var loginURL    : String = "http://192.168.10.78:8080/login"
    var accessToken : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let nameText = name.text ?? ""
        let passwordText = password.text ?? ""
        
        if checkPassword(name: nameText, password: passwordText) {
            callDashboard(with: self.accessToken)
            
        }
        
    }
    
    
    
    
    // MARK:- Password Check and Login
    func checkPassword(name : String , password : String) -> Bool {
        setLoginToken(name: name, password: password)
        return true
    }
    
    
    //MARK:- Networking
    func setLoginToken(name: String, password: String) {
        AlamoLoginPost(user: name, password: password)
    }

func AlamoLoginPost(user username: String , password : String ){
    let olduser = loginUser(name: username, password : password)
    do {
        let jsonData = try JSONEncoder().encode(olduser)
        let params = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
        
        Alamofire.request( self.loginURL , method: .post, parameters: params, encoding: JSONEncoding.default)
                .responseJSON { response in
                    if let data = response.data {
                        do{
                            let json = try JSON(data: data)
                            self.accessToken = json["token"].string!
                            print(self.accessToken)
                        } catch{
                            print("Server sent not data")
                        }
                    }
            }
        } catch {
                print("error")
                }
    }
    
    
    func callDashboard(with token: String)
    {
        let dashboardURL = ""
        let bearer = "Bearer "+token
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        print("About to call dashboard")
        Alamofire.request(dashboardURL, method: .get, headers: headers).responseJSON { response in
            
            guard let data = response.data else { print("No response from server on dashboard"); return }
            guard let name = String(data: data, encoding: .utf8) else {print("Didn't get name "); return }
            print("Got name as "+name)
            let vc = DashboardViewController()
            vc.MainLabel.text = "Hello " + name
            self.navigationController?.pushViewController(vc, animated: true)
          
        }
        
    }
}

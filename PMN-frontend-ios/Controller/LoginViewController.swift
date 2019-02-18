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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let nameText = name.text ?? ""
        let passwordText = password.text ?? ""
        
        if !checkPassword(name: nameText, password: passwordText) {
            print("Invalid passsword")
            
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
        
       
        
        print("Before logging in at "+globalData.loginURL)
        
        Alamofire.request( globalData.loginURL , method: .post, parameters: params, encoding: JSONEncoding.default)
                .responseJSON { response in
                    if let data = response.data {
                        do{
                            let json = try JSON(data: data)
                            globalData.accessToken = json["token"].string!
                            print(globalData.accessToken)
                            self.callDashboard(with: globalData.accessToken)
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
        print("Token is ")
        print(token)
        let bearer = "Bearer "+token
        print(bearer)
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        print("About to call dashboard")
        Alamofire.request( globalData.dashBoardURL , method: .get, headers: headers).responseJSON { response in
            
            guard let data = response.data else { print("No response from server on dashboard"); return }
            print(response.result.value!)
            guard let name = String(data: data, encoding: .utf8) else {print("Didn't get name "); return }
            print("Got name as "+name)
            let vc = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
            vc.name = "Hello " + name
            self.navigationController?.pushViewController(vc, animated: true)
          
        }
        
    }
}

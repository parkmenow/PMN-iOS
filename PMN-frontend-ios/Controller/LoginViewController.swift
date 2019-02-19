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
        
//        instantiateDashboard(name: "Test")
        
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
        
        Alamofire.request( globalData.loginURL , method: .post, parameters: params, encoding: JSONEncoding.default)
                .responseJSON { response in
                    if let data = response.data {
                        do{
                            let json = try JSON(data: data)
                            globalData.accessToken = json["token"].string!
                            self.callDashboard()
                        } catch{
                            print("Server sent not data")
                        }
                    }
            }
        } catch {
                print("error")
                }
    }
    
    
    func callDashboard()
    {
        let bearer = "Bearer "+globalData.accessToken
//        print(bearer)
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        print(headers)
        
        print("\n")
    
        globalData.dashBoardURL = "https://pmn-api-1-staging-v1.herokuapp.com/dashboard/2"
           print("\n")
            print(globalData.dashBoardURL)
           print("\n")
        
        
        Alamofire.request( globalData.dashBoardURL , method: .get, headers: headers ).responseJSON { response in
//            print(bearer)
            guard let data = response.data else { print("No response from server on dashboard"); return }
            print(response.result.value!)
            guard let name = String(data: data, encoding: .utf8) else {print("Didn't get name "); return }
            print("Got name as "+name)
            self.instantiateDashboard(name: name)
        }
    }
    
    func instantiateDashboard(name: String){
        let vc = DashboardViewController(nibName: "DashboardViewController", bundle: nil)
        vc.name = "Hello " + name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

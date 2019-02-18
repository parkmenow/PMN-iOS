//
//  RegisterViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    var accessToken : String = ""
    
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        let fname = firstNameTextField.text  ?? ""
        let lname = lastNameTextField.text ?? ""
        let uname = userNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let phone = phoneNumberField.text ?? ""
        let password = passwordField.text ?? ""
        let confirmPass = confirmPassField.text ?? ""
        
        if password != confirmPass {
            return
        }
        
        let user = newUser(fname: fname, lname: lname, uname: uname, email: email, phoneno: phone, password: password)
        
        if !validate_values(user: user) {
            return
        }
        
        registerUser(newuser:  user)

        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Fields Validation
    
    func validate_values(user: newUser) ->Bool {
       
        return true
    }
    
    //MARK:- Networking
    
    func registerUser(newuser : newUser) {
        //Make POST request to endpoint to register
        
        AlamoRegisterPost(user : newuser)
        
        let vc = DashboardViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        }
    
    func AlamoRegisterPost(user : newUser ){
        do {
            let jsonData = try JSONEncoder().encode(user)
            print(user)
            let params = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
            
            Alamofire.request( globalData.registerURL , method: .post, parameters: params, encoding: JSONEncoding.default)
                .responseJSON { response in
                    if let data = response.data {
                        do{
                            let json = try JSON(data: data)
                            self.accessToken = json["token"].string!
                            print(self.accessToken)
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
        Alamofire.request( globalData.dashBoardURL, method: .get, headers: headers).responseJSON { response in
            
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

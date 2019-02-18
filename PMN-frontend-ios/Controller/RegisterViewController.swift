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
        
        let user = newUser(fname: fname, lname: lname, uname: uname, email: email, phone: phone, password: password)
        
        if !validate_values(user: user) {
            return
        }
        
        registerUser(newuser:  user)
//
        let vc = DashboardViewController()
        navigationController?.pushViewController(vc, animated: true)
//
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Fields Validation
    
    func validate_values(user: newUser) ->Bool {
        print(user)
        return true
    }
    
    //MARK:- Networking
    
    func registerUser(newuser : newUser) {
        //Make POST request to endpoint to register
        
//        let parameters : Parameters = Parameters(dictionaryLiteral: ("user", newuser))
//        let url = URL(string: "http://localhost:8080")!
//
//        Alamofire.upload(parameters, to: url)
        }
//        Alamofire.request(url,method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
    
    


}

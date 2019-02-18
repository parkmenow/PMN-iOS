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
            let vc = DashboardViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    
    // MARK:- Password Check
    
    func checkPassword(name : String , password : String) -> Bool {
        //Start SVD Progress
        print("In Check PAssword")
        getLoginToken(name: name, password: password)
        //make call to backend with name and password and
        return true
    }
    
    
    //MARK:- Networking
    
    func getLoginToken(name: String, password: String) {
    
//        let params = "\"u_name\":\"test1\", \"password\":\"test1\""
        
        print("In post ")
        AlamoPost()
//        post(url: self.loginURL, params: params, successHandler: postHandler)
        
        
    
    }
    
}

//func postHandler(_ response: String) -> Void {
//    print(response)
//}
//
//func post(url : String, params : String, successHandler: @escaping (_ response: String) -> Void) {
//    let url = NSURL(string: url)
//    let params = String(params);
//    let request = NSMutableURLRequest(url: url! as URL);
//    request.httpMethod = "POST"
//    request.httpBody = params.data(using: String.Encoding.utf8)
//
//    let task = URLSession.shared.dataTask(with: request as URLRequest) {
//        data, response, error in
//
//        //in case of error
//        if error != nil {
//            return
//        }
//
//        let responseString : String = String(data: data!, encoding: String.Encoding.utf8)!
//        postHandler(responseString)
//    }
//    task.resume();
//}

func AlamoPost(){
    let parameters: [String: Any] = [
        "IdQuiz" : 102,
        "IdUser" : "iosclient",
        "User" : "iosclient",
        "List": [
            [
                "IdQuestion" : 5,
                "IdProposition": 2,
                "Time" : 32
            ],
            [
                "IdQuestion" : 4,
                "IdProposition": 3,
                "Time" : 9
            ]
        ]
    ]
    
    let parameterAlam : [String: Any] = [
        "u_name" : "test1",
        "password" : "test1"
    ]
    
    let url = "http://192.168.10.78:8080/login"
    
    Alamofire.request( url , method: .post, parameters: parameterAlam, encoding: JSONEncoding.default)
        .responseJSON { response in
            print(response)
    }
}

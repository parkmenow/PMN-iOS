//
//  ViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var serverGet: UILabel!
    let url = "https://pmn-api-1.herokuapp.com/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetch_intro()
    }
    
    func fetch_intro(){
        Alamofire.request(url, method: .get)
            .response { response in
                if response.data != nil {
                    
                   print(response)
                    
                } else {
                    
                    self.serverGet.text = "Connection Issues"
                }
        }
    }
    

}


//
//  PaymentViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameOnCard: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expMonth: UITextField!
    @IBOutlet weak var expYear: UITextField!
    @IBOutlet weak var CVC: UITextField!
    @IBOutlet weak var AmountToPay: UILabel!
    
    
    

    
    @IBAction func confirmPayButtonPressed(_ sender: Any) {
        let name: String = nameOnCard.text ?? "bharath"
        let cardNo: String = cardNumber.text ?? "123456781234"
        let monthstring: String = expMonth.text ?? "12"
        let month: UInt  =  UInt(monthstring) ?? 0
        let year = UInt(expYear.text ?? "2019") ?? 0
        let CVV = CVC.text ?? "000"
        let amount = AmountToPay.text ?? "1000"
        
        
        let parameters : [String: Any] = [
            "name":name,
            "card_no": cardNo,
            "month": month,
            "year": year,
            "cvv": CVV,
            "amount": amount
            ]
        
        
        postChargeBackend(params: parameters)
        
        
       
        
        
    }
    
    
    
    func postChargeBackend(params parameters: [String : Any]) {
        
        Alamofire.request( globalData.chargeURL , method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let data = response.data {
                        print(response.result.value!)
                        print(data)
                }
             
        }
    }
}



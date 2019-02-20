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
    //TODO
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.AmountToPay.text = String(properti.Spots[0].Slots[0].Price)
    }
    
    @IBOutlet weak var nameOnCard: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expMonth: UITextField!
    @IBOutlet weak var expYear: UITextField!
    @IBOutlet weak var CVC: UITextField!
    @IBOutlet weak var AmountToPay: UILabel!
    
    var properti = property()
    

    
    @IBAction func confirmPayButtonPressed(_ sender: Any) {
//        let name: String = nameOnCard.text ?? "bharath"
//        let cardNo: String = cardNumber.text ?? "123456781234"
//        let monthstring: String = expMonth.text ?? "12"
//        let month: UInt  =  UInt(monthstring) ?? 0
//        let year = UInt(expYear.text ?? "2019") ?? 0
//        let CVV = CVC.text ?? "000"
//        let amount = AmountToPay.text ?? "1000"
//        let parameters2 : [String: Any] = [
//            "name":name,
//            "card_no": cardNo,
//            "month": month,
//            "year": year,
//            "cvv": CVV,
//            "amount": amount
//            ]
        
        let parameters : [String : Any] = [
            "SlotID": properti.Spots[0].Slots[0].ID,
            "Price" : properti.Spots[0].Slots[0].Price,
            "Token" : "tok_mastercard"
        
        ]
        
        
        postChargeBackend(params: parameters)
    }
    
    
    
    func postChargeBackend(params parameters: [String : Any]) {

        
        let bearer = "Bearer "+globalData.accessToken
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        
        print(parameters)
        print(headers)
        
        Alamofire.request( globalData.chargeURL , method: .post , parameters: parameters, encoding: JSONEncoding.default ,headers:headers)
            .responseJSON { response in
                if let data = response.data {
                        print(response.result.value!)
                        print(data)
                }
             
        }
    }
}



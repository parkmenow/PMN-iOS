//
//  PaymentViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/18.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import Stripe

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
        let CVV = CVC.text ?? ""
        let amount = AmountToPay.text ?? "1000"
        
        // Initiate the card
        var stripCard = STPCard()
        
        // Send the card info to Strip to get the token
        stripCard.number = cardNo
        stripCard.cvc = CVV
        stripCard.expMonth = month
        stripCard.expYear = year
        stripCard.name = name
        
        
        do{
            var underlyingError: NSError?
            try stripCard.validateReturningError(underlyingError)
                if underlyingError != nil {
                self.spinner.stopAnimating()
                self.handleError(underlyingError!)
                return
                }
  
            STPAPIClient.sharedClient().createTokenWithCard(stripCard, completion: { (token, error) -> Void in
                
                if error != nil {
                    self.handleError(error!)
                    return
                }
                //Send Token here
//                self.postStripeToken(token!)
            })
        
        } catch
            {
                print("Error with validation")
                
        }
    }
    //Send Token to Backend for processing
    func postStripeToken(token: STPToken, chargeAmount amount: int , email mail: String) {
        
        let URL = "http://localhost/donate/payment.php"
        let params = ["stripeToken": token.tokenId,
                      "amount": amount,
                      "currency": "jpy",
                      "description": mail ]
        
        let manager = AFHTTPRequestOperationManager()
        manager.POST(URL, parameters: params, success: { (operation, responseObject) -> Void in
            
            if let response = responseObject as? [String: String] {
                UIAlertView(title: response["status"],
                            message: response["message"],
                            delegate: nil,
                            cancelButtonTitle: "OK").show()
            }
            
        }) { (operation, error) -> Void in
            self.handleError(error!)
        }
    }
    
    func handleError(error: NSError) {
        UIAlertView(title: "Please Try Again",
                    message: error.localizedDescription,
                    delegate: nil,
                    cancelButtonTitle: "OK").show()
        
    }
    

}

// Get from string to uint
extension String {
    func toUInt() -> UInt? {
        let scanner = Scanner(string: self)
        var u: UInt64 = 0
        if scanner.scanUnsignedLongLong(&u)  && scanner.isAtEnd {
            return UInt(u)
        }
        return nil
    }
}

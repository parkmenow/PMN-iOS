//
//  ConfirmBookingViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
//import Stripe
import Alamofire
import SwiftyJSON

class ConfirmBookingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        self.propertID.text = String(selectedProperty.ID)
        self.slotID.text = String(selectedProperty.Spots[0].ID)
        self.startID.text = selectedProperty.Spots[0].Slots[0].StartTime.sliceByString(from: "T", to: "Z")
        self.endID.text = selectedProperty.Spots[0].Slots[0].EndTime.sliceByString(from: "T", to: "Z")
        self.price.text = String(selectedProperty.Spots[0].Slots[0].Price)+"¥"
        self.total.text = String(selectedProperty.Spots[0].Slots[0].Price)+"¥"
        self.paymentMethod.isOn = false
    }
    var selectedProperty = property()
   
    @IBOutlet weak var paymentMethod: UISwitch!
    
    @IBOutlet weak var slotID: UILabel!
    @IBOutlet weak var propertID: UILabel!
    @IBOutlet weak var startID: UILabel!
    @IBOutlet weak var endID: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBAction func confirmBookingPressed(_ sender: Any) {
        
        if self.paymentMethod.isOn {
            customPayment(with: selectedProperty)
//            instantiatePaymentController(with: selectedProperty)
        }
        
        else {
            instantiateWalletPayment(with: selectedProperty)
        }
        
    }
  
    
    func instantiateWalletPayment(with properti: property){
        //TODO write code for handling it here
        
        let params : [String:Any] = [
            "SlotID": properti.Spots[0].ID,
            "Price" : properti.Spots[0].Slots[0].Price
        ]
        
        print("sending value")
        print(params)
        
        let bearer = "Bearer "+globalData.accessToken
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        
        print()
        
        
        
        
        Alamofire.request( globalData.paymentURL , method: .post , parameters: params, encoding: JSONEncoding.default, headers: headers )
            .responseJSON { response in
                if let data = response.data {
                    do{
                        print(data)
                        
                    }
                }
        }
      
        
    }
    
    func customPayment(with properti: property){
        let vc = PaymentViewController(nibName: "PaymentViewController", bundle: nil)
        vc.properti = properti
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func instantiatePaymentController(with properti: property){
        
//        let addCardViewController = STPAddCardViewController()
//        addCardViewController.delegate = self
//        navigationController?.pushViewController(addCardViewController, animated: true)
//
//
    }
    
   
    
}
//extension ConfirmBookingViewController: STPAddCardViewControllerDelegate {
//
//    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
//        navigationController?.popViewController(animated: true)
//    }
//
//    func addCardViewController(_ addCardViewController: STPAddCardViewController,
//                               didCreateToken token: STPToken,
//                               completion: @escaping STPErrorBlock) {
//    }
//
//    func completeCharge(with token: STPToken, amount: Int, completion: @escaping (Result) -> Void) {
//        // 1
//        let url = baseURL.appendingPathComponent("charge")
//        // 2
//        let params: [String: Any] = [
//            "token": token.tokenId,
//            "amount": amount,
//            "currency": "jpy",
//            "description": "haha"
//        ]
//        // 3
//        Alamofire.request(url, method: .post, parameters: params)
//            .validate(statusCode: 200..<300)
//            .responseString { response in
//                switch response.result {
//                case .success:
//                    completion(Result.success)
//                case .failure(let error):
//                    completion(Result.failure(error))
//                }
//        }
//    }
//}



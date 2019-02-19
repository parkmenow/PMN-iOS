//
//  ConfirmBookingViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class ConfirmBookingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        self.propertyID.text = String(selectedSpot.ID)
        self.startID.text = selectedSpot.Slots[0].StartTime.sliceByString(from: "T", to: "Z")
        self.endID.text = selectedSpot.Slots[0].EndTime.sliceByString(from: "T", to: "Z")
        self.price.text = String(selectedSpot.Slots[0].Price)+"¥"
        self.total.text = String(selectedSpot.Slots[0].Price)+"¥"
    }
    var selectedSpot = Spot()
   
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyID: UILabel!
    @IBOutlet weak var startID: UILabel!
    @IBOutlet weak var endID: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBAction func confirmBookingPressed(_ sender: Any) {
        
        instantiatePaymentController()
        
    }
    
    func instantiatePaymentController(){
        
        
        let vc = PaymentViewController(nibName: "PaymentViewController", bundle: nil)
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension String {
    
    func sliceByCharacter(from: Character, to: Character) -> String? {
        let fromIndex = self.index(self.index(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.index(of: to)!, offsetBy: -1)
        return String(self[fromIndex...toIndex])
    }
    
    func sliceByString(from:String, to:String) -> String? {
        //From - startIndex
        var range = self.range(of: from)
        let subString = String(self[range!.upperBound...])
        
        //To - endIndex
        range = subString.range(of: to)
        return String(subString[..<range!.lowerBound])
    }
    
}

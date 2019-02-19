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
  
        
        self.propertID.text = String(selectedProperty.ID)
        self.slotID.text = String(selectedProperty.Spots[0].ID)
        self.startID.text = selectedProperty.Spots[0].Slots[0].StartTime.sliceByString(from: "T", to: "Z")
        self.endID.text = selectedProperty.Spots[0].Slots[0].EndTime.sliceByString(from: "T", to: "Z")
        self.price.text = String(selectedProperty.Spots[0].Slots[0].Price)+"¥"
        self.total.text = String(selectedProperty.Spots[0].Slots[0].Price)+"¥"
    }
    var selectedProperty = property()
   

    @IBOutlet weak var slotID: UILabel!
    @IBOutlet weak var propertID: UILabel!
    @IBOutlet weak var startID: UILabel!
    @IBOutlet weak var endID: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBAction func confirmBookingPressed(_ sender: Any) {
        
        instantiatePaymentController(with: selectedProperty)
        
    }
    
    func instantiatePaymentController(with properti: property){
        
        
        let vc = PaymentViewController(nibName: "PaymentViewController", bundle: nil)
        vc.properti = properti
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

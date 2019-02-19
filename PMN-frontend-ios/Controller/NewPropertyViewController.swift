//
//  NewPropertyViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class NewPropertyViewController: UIViewController {

    @IBOutlet weak var propertyName: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var line2: UITextField!
    @IBOutlet weak var pincode: UITextField!
    
    
    @IBOutlet weak var line1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.propertyName.text = "TO be added"
        self.descriptionField.text = "Can be added"
        self.line1.text = myProperty.Line1
        self.line2.text = myProperty.Line2
        self.pincode.text = myProperty.Pincode
    }
    
    var myProperty = property()

    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        //Make PATCH call to modify entry
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        //MAKE Delete call to delete entry and dismiss the current view
    }
    @IBAction func modifySlotsButtonPressed(_ sender: UIButton) {
        let vc = SlotViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func viewDetailPressed(_ sender: UIButton) {
        let vc = MapViewController()
        vc.lat = Double(myProperty.lat)
        vc.long = Double(myProperty.long)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

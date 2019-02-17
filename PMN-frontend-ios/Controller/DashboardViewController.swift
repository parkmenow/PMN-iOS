//
//  DashboardViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController {

    @IBAction func listingButtonPressed(_ sender: UIButton) {
        //Navigate to my listings
        let vc = ListingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var VehicleTypePicker: UIPickerView!
    @IBOutlet weak var StartTimePicker: UIDatePicker!
    @IBOutlet weak var EndTimePicker: UIDatePicker!
    
    @IBAction func ParkMeButtonPressed(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
 
    
}

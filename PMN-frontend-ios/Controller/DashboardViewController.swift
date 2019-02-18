//
//  DashboardViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var vehicles = ["car","cycle","suv","bus"]
    var selected = 1
    

    

    @IBAction func listingButtonPressed(_ sender: UIButton) {
        //Navigate to my listings
        let vc = ListingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- PickerView Methods
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var VehicleTypePicker: UIPickerView!
    @IBOutlet weak var StartTimePicker: UIDatePicker!
    @IBOutlet weak var EndTimePicker: UIDatePicker!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return vehicles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selected = row
    }
    
    @IBAction func ParkMeButtonPressed(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VehicleTypePicker.delegate = self
        VehicleTypePicker.dataSource = self
        
    }
 
    
}

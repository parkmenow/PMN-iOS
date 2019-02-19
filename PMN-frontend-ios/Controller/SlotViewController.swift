//
//  SlotViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class SlotViewController: UIViewController {

    @IBOutlet weak var slotID: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var availabilitySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slotID.text = String(sloti.ID)
        self.startTime.text = sloti.StartTime
        self.endTime.text = sloti.EndTime
        self.price.text = String(sloti.Price)
        self.availabilitySwitch.isOn = sloti.Available

       
    }
    var sloti = slot()

    @IBAction func confirmButtonPressed(_ sender: UIButton) {
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
}

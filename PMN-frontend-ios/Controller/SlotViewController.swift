//
//  SlotViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class SlotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var AvailabilityField: UITextView!
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
}

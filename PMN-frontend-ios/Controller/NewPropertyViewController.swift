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
    @IBOutlet weak var addressField: UITextView!
    @IBOutlet weak var pincodeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func confirmButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
    }
    @IBAction func modifySlotsButtonPressed(_ sender: UIButton) {
        let vc = SlotViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func viewDetailPressed(_ sender: UIButton) {
        let vc = MapViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

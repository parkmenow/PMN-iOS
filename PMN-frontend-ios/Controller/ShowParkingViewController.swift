//
//  ShowParkingViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class ShowParkingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var properties : [property] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textFieldCell = UINib(nibName: "PropertyTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "PropertyTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as! PropertyTableViewCell
        
        cell.descriptionLabel.text = properties[indexPath.row].Spots[0].Description
        cell.priceLabel.text = "Price: "+String(properties[indexPath.row].Spots[0].Slots[0].Price)
        cell.propertyLabel.text = "PropertyID: "+String( properties[indexPath.row].ID )
        //TODO Spot it change later
        cell.slotID.text = "SlotID: "+String(properties[indexPath.row].Spots[0].ID)
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("int intiinisfnsdjnf")
        print(properties)
//        print("kjdbnfvkwdvn")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 164

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spo = properties[indexPath.row].Spots[0]
        
        instantiateConfirmBooking(with: spo)
    }
    
    
    func instantiateConfirmBooking(with spot: Spot){
        
        
        let vc = ConfirmBookingViewController(nibName: "ConfirmBookingViewController", bundle: nil)
        vc.selectedSpot = spot
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

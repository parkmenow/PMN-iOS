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
    
    var safeProperties : [property] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return safeProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textFieldCell = UINib(nibName: "PropertyTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "PropertyTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as! PropertyTableViewCell
        
        cell.descriptionLabel.text = safeProperties[indexPath.row].Spots[0].Description
        cell.priceLabel.text = "Price: "+String(safeProperties[indexPath.row].Spots[0].Slots[0].Price)
        cell.propertyLabel.text = "PropertyID: "+String( safeProperties[indexPath.row].ID )
        //TODO Spot it change later
        cell.slotID.text = "SlotID: "+String(safeProperties[indexPath.row].Spots[0].ID)
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 164
        
        safeProperties = filterProperties(with: properties)
        
        print("safe Properties are")
        print(safeProperties)

    }
    
    func filterProperties(with unsafeProperties: [property]) ->[property]{
        var safeProperties = [property]()
        for propertyz in unsafeProperties{
            for spotz in propertyz.Spots {
                for slotz in spotz.Slots {
                    let spoti = Spot(ID: spotz.ID, Description: spotz.Description, ImageURL: spotz.ImageURL, Slots: [slotz], PropertyID: spotz.PropertyID)
                    let prop = property(ID: propertyz.ID, Line1: propertyz.Line1, Line2: propertyz.Line2, Pincode: propertyz.Pincode, lat: propertyz.lat, long: propertyz.long, Spots:[spoti] , OwnerID: propertyz.OwnerID)
                    safeProperties.append(prop)
                }
            }
        }
        return safeProperties
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProperty = safeProperties[indexPath.row]
        
        instantiateConfirmBooking(with: selectedProperty)
    }
    
    
    func instantiateConfirmBooking(with property: property){
        
        
        let vc = ConfirmBookingViewController(nibName: "ConfirmBookingViewController", bundle: nil)
        vc.selectedProperty = property
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

//
//  ListingsViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class ListingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = UINib(nibName: "MyPropertyTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "MyPropertyTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPropertyTableViewCell", for: indexPath) as! MyPropertyTableViewCell
 
        let property = myProperties[indexPath.row]
        
        cell.propertyID.text = String(property.ID)
        cell.noOfSlot.text = String(property.Spots.count)
        cell.latitude.text = String(property.lat)
        cell.longitude.text = String(property.long)
        cell.line1.text = property.Line1
        cell.line2.text = property.Line2
        cell.pincode.text = property.Pincode
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProperty = myProperties[indexPath.row]
        
        instantiatePropertyBooking(with: selectedProperty)
    }
    
    
    var myProperties = [property]()

    @IBAction func AddNewProperty(_ sender: UIButton) {
        let vc = NewPropertyViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 170
        
        print(myProperties)

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
    
    func instantiatePropertyBooking(with property: property){
        let vc = NewPropertyViewController(nibName: "NewPropertyViewController", bundle: nil)
        vc.myProperty = property
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

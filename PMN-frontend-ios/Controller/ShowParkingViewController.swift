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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableViewCell", for: indexPath) as! PropertyTableViewCell
        
        cell.descriptionLabel.text = properties[indexPath.row].Spots[0].Description
        cell.priceLabel.text = String(properties[indexPath.row].Spots[0].Slots[0].Price)
        cell.propertyLabel.text = String( properties[indexPath.row].ID )
        //TODO Spot it change later
        cell.slotID.text = String(properties[indexPath.row].Spots[0].ID)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("int intiinisfnsdjnf")
        print(properties)
//        print("kjdbnfvkwdvn")

        // Do any additional setup after loading the view.
    }
    

}

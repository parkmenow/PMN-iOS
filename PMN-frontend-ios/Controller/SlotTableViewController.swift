//
//  SlotTableViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/20.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class SlotTableViewController: UIViewController  ,UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = UINib(nibName: "SlotTableViewCell", bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: "SlotTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlotTableViewCell", for: indexPath) as! SlotTableViewCell
        
        cell.descriptionField.text = spots[indexPath.row].Description
        cell.noofSlots.text = String(spots[indexPath.row].Slots.count)
        cell.propertyID.text = String(spots[indexPath.row].PropertyID)
        cell.spotID.text = String(spots[indexPath.row].ID)
        
        
        return cell
    }
    
    
    var spots = [Spot]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 132
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var slotti = spots[indexPath.row].Slots
    }

}

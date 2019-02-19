//
//  AvailabilityViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/20.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class AvailabilityViewController: UIViewController  ,UITableViewDelegate, UITableViewDataSource {
    
    var Slottt = [slot]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Slottt.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customCell = UINib(nibName: "AvailabilityTableViewCell", bundle: nil)
        self.tableView.register(customCell, forCellReuseIdentifier: "AvailabilityTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvailabilityTableViewCell", for: indexPath) as! AvailabilityTableViewCell
        
        cell.slotID.text = String(Slottt[indexPath.row].ID)
        cell.spotID.text = String(Slottt[indexPath.row].SpotID)
        cell.strtTime.text = Slottt[indexPath.row].StartTime
        cell.endTme.text = Slottt[indexPath.row].EndTime
        cell.price.text = String(Slottt[indexPath.row].Price)
        cell.availability.text = String(Slottt[indexPath.row].Available)
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let slo = Slottt[indexPath.row]
        let vc = SlotViewController(nibName: "SlotViewController", bundle: nil)
        vc.sloti = slo
        navigationController?.pushViewController(vc, animated: true)
        
    }

    

}

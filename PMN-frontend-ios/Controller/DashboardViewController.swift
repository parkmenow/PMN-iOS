//
//  DashboardViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class DashboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var vehicles = ["car","cycle","suv","bus"]
    var selected = 1
    
    var userId = 3
    var name = "Hello User"
    

    @IBAction func listingButtonPressed(_ sender: UIButton) {
        //Navigate to my listings
        
        getAlamoListing()
        
        
        
        
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vehicles[row]
    }
    
    @IBAction func ParkMeButtonPressed(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainLabel.text = name
        VehicleTypePicker.delegate = self
        VehicleTypePicker.dataSource = self
        
    }
    
    func getAlamoListing(){
        
        let bearer = "Bearer "+globalData.accessToken
        print(bearer)
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
  
        Alamofire.request( globalData.listingURL , method: .get, headers: headers)
            .responseJSON { response in
                if let data = response.data {
                    do{
                        let json = try JSON(data: data)
                        print(json)
                        //PARSE JSON
                        //CALL ListingViewController with parsed data
                        self.callListings()
                    } catch{
                        print("Server sent not data")
                    }
                }
        }
    }
    
    func callListings(){
        
    }
 
    
}

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
import MapKit
import CoreLocation

class DashboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {
    
    
    //MARK- Local Variables
    
    var vehicles = ["car","cycle","suv","bus"]
    var selected = 1
    var userId = 3
    var name = "Hello User"
    
    //MARK:- Map options
    var locationManager = CLLocationManager()
    

    
    //MARK:- IBOutlets
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var VehicleTypePicker: UIPickerView!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var startHr: UITextField!
    @IBOutlet weak var endHr: UITextField!
    @IBOutlet weak var startMin: UITextField!
    @IBOutlet weak var endMin: UITextField!
    
    //MARK:- PickerView Methods
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
    
    //MARK:- Button presses
    @IBAction func listingButtonPressed(_ sender: UIButton) {
        
        getAlamoListing()
        //TODO PARSE data to pass to next view
        let vc = ListingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ParkMeButtonPressed(_ sender: Any) {
        
      
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainLabel.text = name
        VehicleTypePicker.delegate = self
        VehicleTypePicker.dataSource = self
        
  
        
        //Location fetch
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||  CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("PLease turn on location services or GPS")
        }
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

// Print out the location to the console
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
        print(location.coordinate)
    }
}
 
    
}

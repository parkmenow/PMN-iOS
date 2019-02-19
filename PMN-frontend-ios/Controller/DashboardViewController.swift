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
    var location = CLLocation(latitude: 37.3321, longitude: -122.0318)
    

    
    //MARK:- IBOutlets
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var VehicleTypePicker: UIPickerView!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var startHr: UITextField!
    @IBOutlet weak var endHr: UITextField!
    @IBOutlet weak var startMin: UITextField!
    @IBOutlet weak var endMin: UITextField!
    @IBOutlet weak var locationButton: UIButton!
    
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
        
//        let vehicleType = vehicles[selected]
//        let lat = location.coordinate.latitude as Double
//        let lon = location.coordinate.longitude as Double
//        let srttime = self.startDate.text!+"T"+self.startHr.text!+"00:00.000Z"
//        let endtime = self.endDate.text!+"T"+self.endHr.text!+"00:00.000Z"
//
//        let parameters : [String: Any] = [
//            "Type" : vehicleType,
//            "Lat": lat,
//            "Long": lon,
//            "StartTime" : srttime,
//            "EndTime" : endtime
//        ]
        
        let prop = getProperty()
        instantiateParkingview(with:prop)
        //TODO uncomment to make dynamic calls
        //AlamoPostParkMeNow(with: parameters)
      
        
    }
    
    func AlamoPostParkMeNow(with parameters: [String : Any]){
        let parkMeNowUrl = "/api/v1/dashboard/"+String(self.userId)+"/parkmenow"
        let bearer = "Bearer "+globalData.accessToken
        print(bearer)
        
        let headers: HTTPHeaders = [
            "Authorization": bearer,
            "Accept": "application/json"
        ]
        
        //TODO Add authentication headers later
        Alamofire.request( parkMeNowUrl , method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                if let data = response.data {
                    do{
                        let json = try JSON(data: data)
                        print(json)
                        //TODO set properties from json later
                        let properties = getProperty()
                        
                        self.instantiateParkingview(with: properties)
                        
                        
                    } catch{
                        print("Server sent not data")
                    }
                }
        }
    }
    
    func instantiateParkingview(with properties: [property]){
        let vc = ShowParkingViewController(nibName: "ShowParkingViewController", bundle: nil)
        vc.properties = properties
//        print(vc.properties)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainLabel.text = name
        VehicleTypePicker.delegate = self
        VehicleTypePicker.dataSource = self
        
        self.startMin.text = "00"
        self.startMin.allowsEditingTextAttributes = false
        
        self.endMin.text = "00"
        self.endMin.allowsEditingTextAttributes = false
        
  
        
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
        if let locationnow = locations.first {
            self.location = locationnow
   
            getReversedLocation(with: locationnow)
        }
    }
    
    func getReversedLocation(with location: CLLocation){
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            
            guard let placemark = placemarks?.first else {
                let errorString = error?.localizedDescription ?? "Unexpected Error"
                print("Unable to reverse geocode the given location. Error: \(errorString)")
                return
            }
            
            let reversedGeoLocation = ReversedGeoLocation(with: placemark)
            print(reversedGeoLocation.cityName)
            self.locationButton.setTitle(reversedGeoLocation.cityName, for: .normal)
            
            
        }
    }
 
    
}

struct ReversedGeoLocation {
    let name: String            // eg. Apple Inc.
    let streetName: String      // eg. Infinite Loop
    let streetNumber: String    // eg. 1
    let city: String            // eg. Cupertino
    let state: String           // eg. CA
    let zipCode: String         // eg. 95014
    let country: String         // eg. United States
    let isoCountryCode: String  // eg. US
    
    var formattedAddress: String {
        return """
        \(name),
        \(streetNumber) \(streetName),
        \(city), \(state) \(zipCode)
        \(country)
        """
    }
    
    var cityName : String {
        return """
        \(city)
        """
    }
    
    // Handle optionals as needed
    init(with placemark: CLPlacemark) {
        self.name           = placemark.name ?? ""
        self.streetName     = placemark.thoroughfare ?? ""
        self.streetNumber   = placemark.subThoroughfare ?? ""
        self.city           = placemark.locality ?? ""
        self.state          = placemark.administrativeArea ?? ""
        self.zipCode        = placemark.postalCode ?? ""
        self.country        = placemark.country ?? ""
        self.isoCountryCode = placemark.isoCountryCode ?? ""
    }
}


//MARK:- Raw data
func getProperty() ->[property] {
    let slo = slot(ID: 1, StartTime: "2006-01-02T14:00:00Z", EndTime: "2006-01-02T15:00:00Z", Price: 100, SpotID: 1, BookingID: 0)
    let spo = Spot(ID: 1, vType: 1,Description:  "Very beautiful can park a cycle", ImageURL : "https://www.archdaily.com/878629/simple-house-moon-hoon/59a4c624b22e389d3e0002a3-simple-house-moon-hoon-image", Slots: [slo], PropertyID: 1)
    let prop = property(ID: 1, Line1: "1-5-6, 1108", Line2: "Higashi-ojima", Pincode: "132-0034", Lat: 35.68981, Long: 139.84755, Spots: [spo], owner_id: 3)
    
    let props = [prop]
    return props
}

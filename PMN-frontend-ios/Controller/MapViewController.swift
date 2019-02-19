//
//  MapViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/17.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {

    let key = globalData.google_map_key
    var mapView : GMSMapView?
    
    var lat : Double = 0.0
    var long: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
                GMSServices.provideAPIKey(key)
                mapAndMarker(lati: self.lat, longi: self.long)
        // Do any additional setup after loading the view.
    }


    
    
    func mapAndMarker(lati : Double,longi: Double){
        let camera = GMSCameraPosition.camera(withLatitude: lati, longitude: longi, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        print("Inside mapAndMarker")
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lati, longitude: longi)
        marker.title = "Work"
        marker.snippet = "mercari"
        marker.map = mapView
        
    }
    
    func setReversedLocation(with location: CLLocation){
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            
            guard let placemark = placemarks?.first else {
                let errorString = error?.localizedDescription ?? "Unexpected Error"
                print("Unable to reverse geocode the given location. Error: \(errorString)")
                return
            }
            
            let reversedGeoLocation = ReversedGeoLocation(with: placemark)
            
            
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

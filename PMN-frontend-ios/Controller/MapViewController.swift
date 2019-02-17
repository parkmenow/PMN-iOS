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

    let key = "AIzaSyAzesTC93HNwqUfAS2ONoc2_LHygrLQ4qU"
    var mapView : GMSMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
                GMSServices.provideAPIKey(key)
                mapAndMarker()
        // Do any additional setup after loading the view.
    }


    
    
    func mapAndMarker(){
        let camera = GMSCameraPosition.camera(withLatitude: 35.660563, longitude: 139.729372, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        print("Inside mapAndMarker")
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 35.660563, longitude: 139.729372)
        marker.title = "Work"
        marker.snippet = "mercari"
        marker.map = mapView
        
    }

}

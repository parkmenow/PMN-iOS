//
//  DashboardViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DashboardViewController: UIViewController {
    
    
    
    //MARK:- Dont know whats happening here
    struct Input {
        var name: String?
    }
    
    let key = "AIzaSyAzesTC93HNwqUfAS2ONoc2_LHygrLQ4qU"
    
    var state: Input
 

    init(input: Input) {
        self.state = input
        super.init(nibName: "DashboardViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func input(_ input: Input) {
        state = input
    }
    //Mark:- Begin here
    
    var mapView : GMSMapView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(key)
        mapAndMarker()
        
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

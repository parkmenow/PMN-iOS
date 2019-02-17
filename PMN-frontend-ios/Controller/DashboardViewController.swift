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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey(key)
        
    }
    
    let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    
    
 

}

//
//  MapViewController.swift
//  B-Store
//
//  Created by Marat on 17.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var map : MKMapView!
    
    var pointTitle = ""
    
    var locateAt = CLLocationCoordinate2DMake(0, 0)
    let span = MKCoordinateSpanMake(0.003, 0.003)
    var region = MKCoordinateRegion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        region = MKCoordinateRegionMake(locateAt, span)

        map.region = region
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locateAt
        annotation.title = pointTitle
        map.addAnnotation(annotation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        region = MKCoordinateRegionMake(locateAt, span)
        
        map.region = region
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locateAt
        annotation.title = pointTitle
        map.addAnnotation(annotation)
        
    }
    
    func setData (data : Branch) {
        
        self.locateAt = CLLocationCoordinate2DMake(Double(data.latitude!)!, Double(data.longitude!)!)
        self.pointTitle = data.address!
        
    }


}

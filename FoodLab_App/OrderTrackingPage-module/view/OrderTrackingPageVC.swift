//
//  OrderTrackingPageVC.swift
//  FoodLab_App
//
//  Created by Que on 21.10.2022.
//

import UIKit
import MapKit
import CoreLocation

class OrderTrackingPageVC: UIViewController {
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        // Do any additional setup after loading the view.
    }
    


}

// resto 38.438699,27.1390415
// home  38.424325, 27.138866
extension OrderTrackingPageVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations[locations.count-1]
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        let hiz = sonKonum.speed
       
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)// ne kadar küçülürse o kadar zoom yapılır
        let bolge = MKCoordinateRegion(center: konum, span: zoom)
        map.setRegion(bolge, animated: true)
        
        map.showsUserLocation = true
        
    }
}


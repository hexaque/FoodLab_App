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
       navigationItem.hidesBackButton = true
       
    }
    
    @IBAction func buttonExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}

// resto 38.438699,27.1390415
// home  38.424325, 27.138866
extension OrderTrackingPageVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations[locations.count-1]
        let latitude = lastLocation.coordinate.latitude
        let longitude = lastLocation.coordinate.longitude
   
       
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let area = MKCoordinateRegion(center: location, span: zoom)
        map.setRegion(area, animated: true)
        
        map.showsUserLocation = true
        
    }
}


//
//  ViewController.swift
//  Karti
//
//  Created by user on 19.10.2021.
//

import UIKit
import CoreLocation


class LocationVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var datalon: UILabel!
    @IBOutlet weak var dataLat: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
    }
    func  checkAuthorization () {
        switch  CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            print("Error")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdatelocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            dataLat.text = String(location.latitude)
            datalon.text = String(location.longitude)
            locationManager.stopUpdatingLocation()
        }
    }


}


//
//  LocationManager.swift
//  Uber Clone
//
//  Created by Ali Erdem Kökcik on 31.01.2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // Most accurate possible location
        locationManager.requestWhenInUseAuthorization() // Requests the user's permission to use location services while the app is in use.
        locationManager.startUpdatingLocation() // Starts updating user's location
    }
}

// MARK: - Extensions
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        locationManager.stopUpdatingLocation()
    }
}

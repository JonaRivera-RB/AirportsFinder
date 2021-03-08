//
//  +MapViewExtension.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 08/03/21.
//

import Foundation
import MapKit

extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 5000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

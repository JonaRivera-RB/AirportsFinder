//
//  MapViewView.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit
import MapKit

class MapViewView: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Properties
    var presenter: MapViewPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension MapViewView: MapViewViewProtocol {
    
    func setupPointsInMap(withData airports: AirportsResponseModel) {
        for airport in airports.response ?? [] {
            let annotation = MKPointAnnotation()
            annotation.coordinate =  CLLocationCoordinate2D(latitude: airport.loc?.lat ?? 0.0, longitude: airport.loc?.long ?? 0.0)
            annotation.title = airport.place?.fullName
            annotation.subtitle = airport.loc?.fullCoordinates
            mapView.addAnnotation(annotation)
        }
    }
    
    func setupMapView(withLocation location: UserLocationModel) {
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        mapView.centerToLocation(initialLocation)
    }
}

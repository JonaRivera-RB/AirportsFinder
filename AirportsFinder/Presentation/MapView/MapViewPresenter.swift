//
//  MapViewPresenter.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class MapViewPresenter  {
    
    // MARK: Properties
    weak var view: MapViewViewProtocol?
    var interactor: MapViewInteractorInputProtocol?
    var wireFrame: MapViewWireFrameProtocol?
    var airportsFound: AirportsResponseModel?
    var userLocation: UserLocationModel?
    
}

extension MapViewPresenter: MapViewPresenterProtocol {
    
    func viewDidLoad() {
        guard let userLocation = userLocation else { return }
        view?.setupMapView(withLocation: userLocation)
        guard let airportsFound = airportsFound else { return }
        view?.setupPointsInMap(withData: airportsFound)
    }
}

extension MapViewPresenter: MapViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

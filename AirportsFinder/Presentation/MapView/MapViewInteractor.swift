//
//  MapViewInteractor.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class MapViewInteractor: MapViewInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MapViewInteractorOutputProtocol?
    var localDatamanager: MapViewLocalDataManagerInputProtocol?
    var remoteDatamanager: MapViewRemoteDataManagerInputProtocol?

}

extension MapViewInteractor: MapViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

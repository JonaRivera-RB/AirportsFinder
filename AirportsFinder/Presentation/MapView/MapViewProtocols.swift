//
//  MapViewProtocols.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

protocol MapViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MapViewPresenterProtocol? { get set }
    func setupMapView(withLocation location: UserLocationModel)
    func setupPointsInMap(withData airports: AirportsResponseModel)
}

protocol MapViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMapViewModule(withData data: AirportsResponseModel, userLocation: UserLocationModel) -> UIViewController
}

protocol MapViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MapViewViewProtocol? { get set }
    var interactor: MapViewInteractorInputProtocol? { get set }
    var wireFrame: MapViewWireFrameProtocol? { get set }
    var airportsFound: AirportsResponseModel? { get set }
    var userLocation: UserLocationModel? { get set }
    
    func viewDidLoad()
}

protocol MapViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MapViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MapViewInteractorOutputProtocol? { get set }
    var localDatamanager: MapViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapViewRemoteDataManagerInputProtocol? { get set }
}

protocol MapViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MapViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MapViewRemoteDataManagerOutputProtocol? { get set }
}

protocol MapViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MapViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}

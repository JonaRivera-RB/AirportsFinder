//
//  MainProtocols.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MainPresenterProtocol? { get set }
    func showLoadingView()
    func dismissLoadingView()
    func presenterPushDataView(receivedData: AirportsResponseModel)
    func presenterPushErrorView(receivedError: String)
    func setupUI()
    func setupLocationManager()
    func startTrackingGPS()
    func accessDeniedModal()
}

protocol MainWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMainModule() -> UIViewController
    func presentTabBar(from view: MainViewProtocol, widhData data: AirportsResponseModel, userLocation: UserLocationModel)
}

protocol MainPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showTabBar(withData data: AirportsResponseModel, userLocation: UserLocationModel)
    func searchAirports(withLocation Location: UserLocationModel)
    func showDeniedPermissionModal()
}

protocol MainInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorPushDataInPresenter(with data: AirportsResponseModel)
    func interactorPushErrorInPresenter(with error: String)
}

protocol MainInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MainInteractorOutputProtocol? { get set }
    var localDatamanager: MainLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MainRemoteDataManagerInputProtocol? { get set }
    
    func searchAirports(withLocation Location: UserLocationModel)
    
}

protocol MainDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MainRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol? { get set }
    func searchAirportsInInternet(withLocation Location: UserLocationModel)
}

protocol MainRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallbackAirports(with data: AirportsResponseModel)
    func remoteDataManagerCallbackAirportsWithError(with error: String)
}

protocol MainLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}

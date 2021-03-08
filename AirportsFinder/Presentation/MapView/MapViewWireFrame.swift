//
//  MapViewWireFrame.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

class MapViewWireFrame: MapViewWireFrameProtocol {

    class func createMapViewModule(withData data: AirportsResponseModel, userLocation: UserLocationModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MapView")
        if let view = viewController as? MapViewView {
            let presenter: MapViewPresenterProtocol & MapViewInteractorOutputProtocol = MapViewPresenter()
            let interactor: MapViewInteractorInputProtocol & MapViewRemoteDataManagerOutputProtocol = MapViewInteractor()
            let localDataManager: MapViewLocalDataManagerInputProtocol = MapViewLocalDataManager()
            let remoteDataManager: MapViewRemoteDataManagerInputProtocol = MapViewRemoteDataManager()
            let wireFrame: MapViewWireFrameProtocol = MapViewWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.airportsFound = data
            presenter.userLocation = userLocation
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MapView", bundle: Bundle.main)
    }
    
}

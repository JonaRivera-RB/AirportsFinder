//
//  ListViewWireFrame.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

class ListViewWireFrame: ListViewWireFrameProtocol {

    class func createListViewModule(withData data: AirportsResponseModel, userLocation: UserLocationModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ListView")
        if let view = viewController as? ListViewView {
            let presenter: ListViewPresenterProtocol & ListViewInteractorOutputProtocol = ListViewPresenter()
            let interactor: ListViewInteractorInputProtocol & ListViewRemoteDataManagerOutputProtocol = ListViewInteractor()
            let localDataManager: ListViewLocalDataManagerInputProtocol = ListViewLocalDataManager()
            let remoteDataManager: ListViewRemoteDataManagerInputProtocol = ListViewRemoteDataManager()
            let wireFrame: ListViewWireFrameProtocol = ListViewWireFrame()
            
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
        return UIStoryboard(name: "ListView", bundle: Bundle.main)
    }
    
}

//
//  MainWireFrame.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

class MainWireFrame: MainWireFrameProtocol {
    
    func presentTabBar(from view: MainViewProtocol, widhData data: AirportsResponseModel, userLocation: UserLocationModel) {
        let submodules = (
            mapAirports: MapViewWireFrame.createMapViewModule(withData: data, userLocation: userLocation),
            listAirports: ListViewWireFrame.createListViewModule(withData: data, userLocation: userLocation))
        
        let tabBar = TabBarModuleBuilder.build(usingSubmodules: submodules)
        
        if let newTabBar = view as? UIViewController {
            tabBar.modalPresentationStyle = .fullScreen
            newTabBar.present(tabBar, animated: true, completion: nil)
        }
    }
    
    
    class func createMainModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainView")
        if let view = viewController as? MainView {
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
            let interactor: MainInteractorInputProtocol & MainRemoteDataManagerOutputProtocol = MainInteractor()
            let localDataManager: MainLocalDataManagerInputProtocol = MainLocalDataManager()
            let remoteDataManager: MainRemoteDataManagerInputProtocol = MainRemoteDataManager()
            let wireFrame: MainWireFrameProtocol = MainWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MainView", bundle: Bundle.main)
    }
    
}

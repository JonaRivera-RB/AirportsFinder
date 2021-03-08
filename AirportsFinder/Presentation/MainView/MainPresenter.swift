//
//  MainPresenter.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class MainPresenter  {
    
    // MARK: Properties
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
    
}

extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        view?.setupUI()
        view?.setupLocationManager()
        view?.startTrackingGPS()
    }
    
    func showDeniedPermissionModal() {
        view?.accessDeniedModal()
    }
    
    func searchAirports(withLocation Location: UserLocationModel) {
        interactor?.searchAirports(withLocation: Location)
        view?.showLoadingView()
    }
    
    func showTabBar(withData data: AirportsResponseModel, userLocation: UserLocationModel) {
        wireFrame?.presentTabBar(from: view!, widhData: data, userLocation: userLocation)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    func interactorPushErrorInPresenter(with error: String) {
        view?.dismissLoadingView()
        view?.presenterPushErrorView(receivedError: error)
    }
    
    
    func interactorPushDataInPresenter(with data: AirportsResponseModel) {
        view?.presenterPushDataView(receivedData: data)
        view?.dismissLoadingView()
    }
}

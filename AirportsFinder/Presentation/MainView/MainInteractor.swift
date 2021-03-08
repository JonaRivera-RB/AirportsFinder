//
//  MainInteractor.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: MainInteractorOutputProtocol?
    var localDatamanager: MainLocalDataManagerInputProtocol?
    var remoteDatamanager: MainRemoteDataManagerInputProtocol?
    
    func searchAirports(withLocation Location: UserLocationModel) {
        remoteDatamanager?.searchAirportsInInternet(withLocation: Location)
    }
}

extension MainInteractor: MainRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallbackAirportsWithError(with error: String) {
        presenter?.interactorPushErrorInPresenter(with: error)
    }
    
    func remoteDataManagerCallbackAirports(with data: AirportsResponseModel) {
        presenter?.interactorPushDataInPresenter(with: data)
    }
}

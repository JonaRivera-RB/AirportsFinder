//
//  ListViewInteractor.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class ListViewInteractor: ListViewInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListViewInteractorOutputProtocol?
    var localDatamanager: ListViewLocalDataManagerInputProtocol?
    var remoteDatamanager: ListViewRemoteDataManagerInputProtocol?

}

extension ListViewInteractor: ListViewRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}

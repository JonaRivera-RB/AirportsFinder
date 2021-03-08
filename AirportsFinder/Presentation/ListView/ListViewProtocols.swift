//
//  ListViewProtocols.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

protocol ListViewViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListViewPresenterProtocol? { get set }
    func setupTableView()
    func setupDataInView(withData airports: AirportsResponseModel)
}

protocol ListViewWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListViewModule(withData data: AirportsResponseModel, userLocation: UserLocationModel) -> UIViewController
}

protocol ListViewPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListViewViewProtocol? { get set }
    var interactor: ListViewInteractorInputProtocol? { get set }
    var wireFrame: ListViewWireFrameProtocol? { get set }
    var airportsFound: AirportsResponseModel? { get set }
    var userLocation: UserLocationModel? { get set }
    
    func viewDidLoad()
}

protocol ListViewInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ListViewInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListViewInteractorOutputProtocol? { get set }
    var localDatamanager: ListViewLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListViewRemoteDataManagerInputProtocol? { get set }
}

protocol ListViewDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ListViewRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListViewRemoteDataManagerOutputProtocol? { get set }
}

protocol ListViewRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListViewLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}

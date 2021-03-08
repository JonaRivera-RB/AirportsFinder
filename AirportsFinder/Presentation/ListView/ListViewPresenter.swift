//
//  ListViewPresenter.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class ListViewPresenter  {
    
    // MARK: Properties
    weak var view: ListViewViewProtocol?
    var interactor: ListViewInteractorInputProtocol?
    var wireFrame: ListViewWireFrameProtocol?
    var airportsFound: AirportsResponseModel?
    var userLocation: UserLocationModel?
    
}

extension ListViewPresenter: ListViewPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        guard let airportsFound = airportsFound else { return }
        view?.setupDataInView(withData: airportsFound)
        view?.setupTableView()
    }    
}

extension ListViewPresenter: ListViewInteractorOutputProtocol {
    // TODO: implement interactor output methods
}

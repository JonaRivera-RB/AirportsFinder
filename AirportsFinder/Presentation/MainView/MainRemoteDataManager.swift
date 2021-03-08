//
//  MainRemoteDataManager.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation

class MainRemoteDataManager:MainRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol?
    
    let getRequest = GetDataHttp()
    
    func searchAirportsInInternet(withLocation Location: UserLocationModel) {
        
        getRequest.url = URL(string: "https://api.aerisapi.com/places/airports/closest/?p=\(Location.latitude),\(Location.longitude)&limit=5&radius=\(Location.distance)miles&filter=largeairport&client_id=8G51P2cdZk5U29dHszPHG&client_secret=iFj7MfpcdchoM2r6NMDSoBiWB8mH0WVVbAqdWLaM")
        getRequest.forData { (data, error, success) in
            if success {
                if let data = data, let result = DataFetcher<AirportsResponseModel>().getData(data: data) {
                    print("the data is \(result)")
                    self.remoteRequestHandler?.remoteDataManagerCallbackAirports(with: result)
                    return
                }
            }else {
                print("hubo un error")
                self.remoteRequestHandler?.remoteDataManagerCallbackAirportsWithError(with: AppConstans.Errors.genericError)
                return
            }
            self.remoteRequestHandler?.remoteDataManagerCallbackAirportsWithError(with: AppConstans.Errors.genericError)
            return
        }
    }
}

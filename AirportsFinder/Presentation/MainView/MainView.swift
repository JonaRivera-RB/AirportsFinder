//
//  MainView.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit
import CoreData

class MainView: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: Properties
    var presenter: MainPresenterProtocol?
    var locationManager = CLLocationManager()
    private var currentAccurateLocation:CLLocation?
    private var distance: Int = 0
    private var userLocation: UserLocationModel?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func searchAirportsBtnAction() {
        guard let latitude = currentAccurateLocation?.coordinate.latitude else { return }
        guard let longitude = currentAccurateLocation?.coordinate.longitude else { return }
        
        userLocation = UserLocationModel(latitude: latitude, longitude: longitude, distance: distance)
        if let userLocation = userLocation {
            presenter?.searchAirports(withLocation: userLocation)
        }else {
            presenter?.showDeniedPermissionModal()
            return
        }
    }
    
    @objc func valueChanged(sender: UISlider) {
        distance = Int(sender.value)
        distanceLabel.text = "\(Int(sender.value))"
    }
}

extension MainView: MainViewProtocol {
    func presenterPushErrorView(receivedError: String) {
        presentAlert(withTitle: "", message: receivedError)
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startTrackingGPS() {
        setupLocation()
    }
    
    func accessDeniedModal() {
        let alertController = UIAlertController(title: AppConstans.Message.modalTitleDeniedAlert,
                                                message: AppConstans.Message.modalTitleDeniedMessage,
                                                preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: AppConstans.GenericMessage.settings, style: .default) { (alertAction) in
            
            if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings as URL)
            }
        }
        
        alertController.addAction(settingsAction)
        
        let cancelAction = UIAlertAction(title: AppConstans.GenericMessage.cancel, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func setupUI() {
        searchButton.roundCorners(with: CGFloat(AppConstans.CornerRadius.buttonRadius))
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    
    func presenterPushDataView(receivedData: AirportsResponseModel) {
        guard let userLocation = userLocation else { return }
        presenter?.showTabBar(withData: receivedData, userLocation: userLocation)
    }
    
    func showLoadingView() {
        showUniversalLoadingView(true, loadingText: AppConstans.Message.modalTitleSearchAirports)
    }
    
    func dismissLoadingView() {
        showUniversalLoadingView(false)
    }
}

extension MainView: CLLocationManagerDelegate {
    
    func stopTrackingGPS() {
        locationManager.stopUpdatingLocation()
    }
    
    private func validateLocationUseAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .denied:
            presenter?.showDeniedPermissionModal()
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            presenter?.showDeniedPermissionModal()
            break
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        @unknown default:
            fatalError()
        }
    }
    
    private func setupLocation() {
        if CLLocationManager.locationServicesEnabled() {
            validateLocationUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        setupLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if (currentAccurateLocation == nil) {
            if let location = locations.first {
                currentAccurateLocation = location
            }
        } else {
            guard let currentLocation = self.currentAccurateLocation else { return }
            if let newLocation = locations.first {
                if (newLocation.horizontalAccuracy < currentLocation.horizontalAccuracy) {
                    currentAccurateLocation = newLocation
                    if (newLocation.horizontalAccuracy < 10) {
                        locationManager.stopUpdatingLocation()
                    }
                }
            }
        }
    }
    
}

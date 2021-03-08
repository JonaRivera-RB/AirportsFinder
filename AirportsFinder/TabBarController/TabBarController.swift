//
//  TabBarController.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation
import UIKit

typealias AirportsFinderTaps = (
    mapAirports: UIViewController,
    listAirports: UIViewController
)

class TabBarController: UITabBarController {
    init(tabs: AirportsFinderTaps) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.mapAirports, tabs.listAirports]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
    }
}

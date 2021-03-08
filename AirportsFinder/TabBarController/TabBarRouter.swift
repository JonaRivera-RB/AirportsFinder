//
//  TabBarRouter.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation
import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias Submodules = (
        mapAirports: UIViewController,
        listAirports: UIViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TabBarRouter {
    static func tabs(usingSubmodules submodules: Submodules) -> AirportsFinderTaps {
        
        let mapTap = UITabBarItem(title: "Map", image: nil, tag: 11)
        let listTap = UITabBarItem(title: "List", image: nil, tag: 12)
        
        submodules.mapAirports.tabBarItem = mapTap
        submodules.listAirports.tabBarItem = listTap
        
        return (
            mapAirports: submodules.mapAirports,
            listAirports: submodules.listAirports
        )
    }
}

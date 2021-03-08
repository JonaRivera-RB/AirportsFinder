//
//  +UIViewExtension.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(with radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

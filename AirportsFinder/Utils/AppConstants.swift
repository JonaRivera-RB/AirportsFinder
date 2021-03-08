//
//  AppConstants.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation

struct AppConstans {
    struct CornerRadius {
        static let buttonRadius = 12.0
    }
    
    struct Message {
        static let modalTitleSearchAirports = "Searching Airports..."
        static let modalTitleDeniedAlert = "AirportsFinder"
        static let modalTitleDeniedMessage = "The Location permission was not authorized. Please enable it in Settings to continue."
    }
    
    struct GenericMessage {
        static let cancel = "Cancel"
        static let settings = "Settings"
    }
    
    struct Errors {
        static let genericError = "There was an unexpected error we are working to fix it"
    }
}

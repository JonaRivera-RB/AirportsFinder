//
//  AirportsResponseModel.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//

import Foundation

// MARK: - AirportsResponseModel
struct AirportsResponseModel: Codable {
    var success: Bool?
    var error: String?
    var response: [ResponseAirports]?
}

struct ResponseAirports: Codable {
    var id: String?
    var loc: LOC?
    var place: Place?
}

struct LOC: Codable {
    var lat: Double?
    var long: Double?
}

struct Place: Codable {
    var name: String?
    var city: String?
    var state: String?
    var stateFull: String?
    var country: String?
    var countryFull: String?
    var region: String?
    var regionFull: String?
    var continent: String?
    var continentFull: String?
}

extension AirportsResponseModel {
    var airportsCount: Int {
        return response?.count ?? 0
    }
}

extension LOC {
    var fullCoordinates: String {
        return "\(lat ?? 0.0), \(long ?? 0.0)"
    }
}

extension Place {
    var fullName: String {
        return "\(name ?? ""), \(city ?? ""), \(state ?? ""), \(country ?? "")"
    }
}

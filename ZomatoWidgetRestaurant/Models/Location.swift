//
//  Location.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Location: Codable {
    var address: String?
    var locality: String?
    var city: String?
    var cityId: Double?
    var latitude: String?
    var longitude: String?
    var zipcode: String?
    var countryId: Double?
    var localityVerbose: String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address" // (string, optional): Complete address of the restaurant ,
        case locality = "locality"// (string, optional): Name of the locality ,
        case city = "city" //(string, optional): Name of the city ,
        case cityId = "city_id"
        case latitude = "latitude" // (number, optional): Coordinates of the restaurant ,
        case longitude = "longitude" // (number, optional): Coordinates of the restaurant ,
        case zipcode = "zipcode" //(string, optional): Zipcode
        case countryId = "country_id" // (integer, optional): ID of the country
        case localityVerbose = "locality_verbose"
    }
}

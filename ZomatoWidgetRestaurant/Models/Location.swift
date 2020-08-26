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
    var latitude: Int?
    var longitude: Int?
    var zipcode: String?
    var countryId: Int?
    enum CodingKeys: String, CodingKey {
        case address = "address" // (string, optional): Complete address of the restaurant ,
        case locality = "locality"// (string, optional): Name of the locality ,
        case city = "city" //(string, optional): Name of the city ,
        case latitude = "latitude" // (number, optional): Coordinates of the restaurant ,
        case longitude = "longitude" // (number, optional): Coordinates of the restaurant ,
        case zipcode = "zipcode" //(string, optional): Zipcode
        case countryId = "country_id" // (integer, optional): ID of the country
        
    }
}

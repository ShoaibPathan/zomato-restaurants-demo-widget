//
//  Search.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Search: NSObject ,Codable, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(resultsFound, forKey: CodingKeys.resultsFound.rawValue)
        aCoder.encode(resultsStart, forKey: CodingKeys.resultsStart.rawValue)
        aCoder.encode(resultsShown, forKey: CodingKeys.resultsShown.rawValue)
        aCoder.encode(restaurants, forKey: CodingKeys.restaurants.rawValue)
    }
    
    required init?(coder decoder: NSCoder) {
        resultsFound = decoder.decodeObject(forKey: CodingKeys.resultsFound.rawValue) as? Int
        resultsStart = decoder.decodeObject(forKey: CodingKeys.resultsStart.rawValue) as? Int
        resultsShown = decoder.decodeObject(forKey: CodingKeys.resultsShown.rawValue) as? Int
        restaurants = decoder.decodeObject(forKey: CodingKeys.restaurants.rawValue) as? [Restaurant]
    }
    
    
    var resultsFound: Int?
    var resultsStart: Int?
    var resultsShown: Int?
    var restaurants: [Restaurant]?
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found" // (integer, optional): Number of results found ,
        case resultsStart = "results_start" // (integer, optional): The starting location within results from which the results were fetched (used for pagination) ,
        case resultsShown = "results_shown" //(integer, optional): The number of results fetched (used for pagination) ,
        case restaurants = "restaurants" //(Array[RestaurantL3], optional)
    }
}

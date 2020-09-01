//
//  Search.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Search: Codable {
    var resultsFound: Int?
    var resultsStart: Int?
    var resultsShown: Int?
    var restaurants: [RestaurantModel]?
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found" // (integer, optional): Number of results found ,
        case resultsStart = "results_start" // (integer, optional): The starting location within results from which the results were fetched (used for pagination) ,
        case resultsShown = "results_shown" //(integer, optional): The number of results fetched (used for pagination) ,
        case restaurants = "restaurants" //(Array[RestaurantL3], optional)
    }
}

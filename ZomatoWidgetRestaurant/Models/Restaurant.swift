//
//  Restaurant.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class RestaurantModel: Codable {
    var restaurant: Restaurant?
    
    enum CodingKeys: String, CodingKey {
        case restaurant
    }
}

class Restaurant: Codable {
    var id: String?
    var name: String?
    var location: Location?
    var thumb: String?
    var cuisines: String?
    var allReviewCount: Int?
    var establishments: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case location = "location"
        case thumb = "thumb"
        case cuisines = "cuisines"
        case allReviewCount = "all_reviews_count"
        case establishments = "establishment"
    }
}

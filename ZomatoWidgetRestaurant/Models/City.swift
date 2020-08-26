//
//  City.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class City: Codable {
    var id: String?
    var name: String?
    var countryId: String?
    var isState: String?
    var stateId: String?
    var stateName: String?
    var stateCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryId = "country_id"
        case isState = "is_state"
        case stateId = "state_id"
        case stateName = "state_name"
        case stateCode = "state_code"
    }
}

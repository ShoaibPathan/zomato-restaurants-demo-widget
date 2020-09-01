//
//  Location.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Location: Codable {
    var localityVerbose: String?
    
    enum CodingKeys: String, CodingKey {
        case localityVerbose = "locality_verbose"
    }
}

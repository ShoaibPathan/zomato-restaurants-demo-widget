//
//  Categories.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 03/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

enum TypesOfSearch: Int, CaseIterable {
    case search
    case categories
    case location
    
    var description: String {
        get {
            switch self {
            case .search:
                return "search"
            case .categories:
                return "categories"
            case .location:
                return "location"
            }
        }
    }
}

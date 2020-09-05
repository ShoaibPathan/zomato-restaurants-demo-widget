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
                return "Search"
            case .categories:
                return "Categories"
            case .location:
                return "Location"
            }
        }
    }
    
    var apiDesc: String {
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

class CategoryList: Codable {
    var categories: [CategoriesModel]?
}

class CategoriesModel: Codable {
    var categories: Categories?
}

class Categories: Codable {
    var id: Int?
    var name: String?
}

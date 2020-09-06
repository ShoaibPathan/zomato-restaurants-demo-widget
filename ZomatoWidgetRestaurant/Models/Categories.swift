//
//  Categories.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 03/09/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

enum TypesOfSearch: Int, CaseIterable {
    case categories
    
    var description: String {
        get {
            switch self {
            case .categories:
                return "Categories"
            }
        }
    }
    
    var apiDesc: String {
        get {
            switch self {
            case .categories:
                return "categories"
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

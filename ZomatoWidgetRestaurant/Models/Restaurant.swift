//
//  Restaurant.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

struct RestaurantStruct: Codable {
    let r: RClassStruct?
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case r = "R"
        case id = "id"
        case name = "name"
    }
}

struct RClassStruct: Codable {
    let resId: Double?
    let isGroceryStore: Bool?
    
    enum CodingKeys: String, CodingKey {
    //        case hasMenuStatus = "has_menu_status"
        case resId = "res_id"
        case isGroceryStore = "is_grocery_store"
    }
}

class Restaurant: NSObject, Codable, NSCoding {
    
    var r: RClass?
    var id: String?
    var name: String?
    var location: Location?
    var averageCostForTwo: Int?
    var priceRange: Int?
    var currency: String?
    var thumb: String?
    var featuredImage: String?
    var photosUrl: String?
    var menuUrl: String?
    var eventsUrl: String?
    var userRating: UserRating?
    var hasOnlineDel: Bool?
    var isDelNow: Bool?
    var hasTableBooking: Bool?
    var deeplink: String?
    var cuisines: String?
    var allReviewCount: Int?
    var photoCount: Int?
    var phoneNumbers: String?
    var photos: [Photo]?
    var allReviews: [Review]?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: CodingKeys.id.rawValue)
        aCoder.encode(name, forKey: CodingKeys.name.rawValue)
        aCoder.encode(r, forKey: CodingKeys.r.rawValue)
    }
    
    required init?(coder: NSCoder) {
        id = coder.decodeObject(forKey: CodingKeys.id.rawValue) as? String
        name = coder.decodeObject(forKey: CodingKeys.name.rawValue) as? String
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//
        r = coder.decodeObject(forKey: CodingKeys.r.rawValue) as? RClass
        
//        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
    
    enum CodingKeys: String, CodingKey {
        case r = "R"
        case id = "id"
        case name = "name"
        case location = "location"// (ResLocation, optional): Restaurant location details ,
        case averageCostForTwo = "average_cost_for_two"// (integer, optional): Average price of a meal for two people ,
        case priceRange = "price_range" //(integer, optional): Price bracket of the restaurant (1 being pocket friendly and 4 being the costliest) ,
        case currency = "currency"//(string, optional): Local currency symbol; to be used with price ,
        case thumb = "thumb"//(string, optional): URL of the low resolution header image of restaurant ,
        case featuredImage = "featured_image" // (string, optional): URL of the high resolution header image of restaurant ,
        case photosUrl = "photos_url" // (string, optional): URL of the restaurant's photos page ,
        case menuUrl = "menu_url" // (string, optional): URL of the restaurant's menu page ,
        case eventsUrl = "events_url" // (string, optional): URL of the restaurant's events page ,
        case userRating = "user_rating" // (UserRating, optional): Restaurant rating details ,
        case hasOnlineDel = "has_online_delivery" // (boolean, optional): Whether the restaurant has online delivery enabled or not ,
        case isDelNow = "is_delivering_now" // (boolean, optional): Valid only if has_online_delivery = 1; whether the restaurant is accepting online orders right now ,
        case hasTableBooking = "has_table_booking" // (boolean, optional): Whether the restaurant has table reservation enabled or not ,
        case deeplink = "deeplink" // (string, optional): Short URL of the restaurant page; for use in apps or social shares ,
        case cuisines = "cuisines" // (string, optional): List of cuisines served at the restaurant in csv format ,
        case allReviewCount = "all_reviews_count" // (integer, optional): [Partner access] Number of reviews for the restaurant ,
        case photoCount = "photo_count" // (integer, optional): [Partner access] Total number of photos for the restaurant, at max 10 photos for partner access ,
        case phoneNumbers = "phone_numbers" // (string, optional): [Partner access] Restaurant's contact numbers in csv format ,
        case photos = "photos" // (Array[Photo], optional): [Partner access] List of restaurant photos ,
        case allReviews = "all_reviews" // (Array[Review], optional): [Partner access] List of restaurant reviews
    }
}

class RClass : NSObject, Codable, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(resId, forKey: CodingKeys.resId.rawValue)
        aCoder.encode(isGroceryStore, forKey: CodingKeys.isGroceryStore.rawValue)
    }
    
//    var hasMenuStatus: [String : Any?]?
    var resId: Double?
    var isGroceryStore: Bool?
    
    enum CodingKeys: String, CodingKey {
//        case hasMenuStatus = "has_menu_status"
        case resId = "res_id"
        case isGroceryStore = "is_grocery_store"
    }
    
    required init?(coder: NSCoder) {
        resId = coder.decodeObject(forKey: CodingKeys.resId.rawValue) as? Double
        isGroceryStore = coder.decodeObject(forKey: CodingKeys.isGroceryStore.rawValue) as? Bool
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//
//        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
//        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
    }
}

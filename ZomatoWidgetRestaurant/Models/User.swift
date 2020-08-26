//
//  User.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class User: Codable {
    
    var name: String?
    var zomatoHandle: String?
    var foodieLevel: String?
    var foodieLevelNum: Int?
    var foodieColor: String?
    var profileUrl: String?
    var profileDeeplink: String?
    var profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name" // (string, optional): User's name ,
        case zomatoHandle = "zomato_handle" // (string, optional): User's @handle; uniquely identifies a user on Zomato ,
        case foodieLevel = "foodie_level" // (string, optional): Text for user's foodie level ,
        case foodieLevelNum = "foodie_level_num" // (integer, optional): Number to identify user's foodie level; ranges from 0 to 10 ,
        case foodieColor = "foodie_color" // (string, optional): Color hex code used with foodie level on Zomato ,
        case profileUrl = "profile_url" // (string, optional): URL for user's profile on Zomato ,
        case profileDeeplink = "profile_deeplink" // (string, optional): short URL for user's profile on Zomato; for use in apps or social sharing ,
        case profileImage = "profile_image" // (string, optional): URL for user's profile image
    }
}

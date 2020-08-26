//
//  Review.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Review: Codable {
    var rating: Int?
    var reviewText: String?
    var id: Int?
    var ratingColor: String?
    var reviewTimeFriendly: String?
    var ratingText: String?
    var timestamp: Int?
    var user: User?
    var commentsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case rating = "rating" // (number, optional): Rating on scale of 0 to 5 in increments of 0.5 ,
        case reviewText = "review_text" // (string, optional): Review text ,
        case id = "id" // (integer, optional): ID of the review ,
        case ratingColor = "rating_color" // (string, optional): Color hex code used with the rating on Zomato ,
        case reviewTimeFriendly = "review_time_friendly" // (string, optional): User friendly time string corresponding to time of review posting ,
        case ratingText = "rating_text" // (string, optional): Short description of the rating ,
        case timestamp = "timestamp" // (integer, optional): Unix timestamp for review_time_friendly , likes (integer, optional): No of likes received for review ,
        case user = "user" // (User, optional): User details of author of review ,
        case commentsCount = "comments_count" // (integer, optional): No of comments on review
    }
}

class UserRating: Codable {
    var aggregateRating: Double?
    var ratingText: String?
    var ratingColor: String?
    var votes: Int?
    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating" //(number, optional): Restaurant rating on a scale of 0.0 to 5.0 in increments of 0.1 ,
        case ratingText = "rating_text" // (string, optional): Short description of the rating ,
        case ratingColor = "rating_color" // (string, optional): Color hex code used with the rating on Zomato ,
        case votes = "votes" // (integer, optional): Number of ratings received
    }
}

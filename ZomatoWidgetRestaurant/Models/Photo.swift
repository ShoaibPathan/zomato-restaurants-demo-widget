//
//  Photo.swift
//  ZomatoSearch
//
//  Created by Amirthy Tejeshwar on 10/09/19.
//  Copyright © 2019 Amirthy Tejeshwar. All rights reserved.
//

import Foundation

class Photo: Codable {
    var id: String?
    var url: String?
    var thumbUrl: String?
    var user: User?
    var resId: Int?
    var caption: String?
    var timestamp: Int?
    var friendlyTime: String?
    var width: Int?
    var height: Int?
    var commentsCount: Int?
    var likesCount: Int?
    enum CodingKeys: String, CodingKey {
        case id = "id" // (string, optional): ID of the photo ,
        case url = "url" // (string, optional): URL of the image file ,
        case thumbUrl = "thumb_url" // (string, optional): URL for 200 X 200 thumb image file ,
        case user = "user" // (User, optional): User who uploaded the photo ,
        case resId = "res_id" // (integer, optional): ID of restaurant for which the image was uploaded ,
        case caption = "caption" // (string, optional): Caption of the photo ,
        case timestamp = "timestamp" // (integer, optional): Unix timestamp when the photo was uploaded ,
        case friendlyTime = "friendly_time" // (string, optional): User friendly time string; denotes when the photo was uploaded ,
        case width = "width" // (integer, optional): Image width in pixel; usually 640 ,
        case height = "height" // (integer, optional): Image height in pixel; usually 640 ,
        case commentsCount = "comments_count" // (integer, optional): Number of comments on photo ,
        case likesCount = "likes_count" // (integer, optional): Number of likes on photo
    }
}

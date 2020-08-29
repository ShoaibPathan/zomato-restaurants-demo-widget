//
//  ZomatoApi.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 27/08/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import Foundation


class ZomatoApi {
    
    let baseUrl = "https://developers.zomato.com/api/v2.1"
    
    func getSearchResponse<T: Codable>(type: T.Type, entityId: Int = 5, completion: @escaping ((Bool, T?, Error?) -> Void)) {
        let urlString = baseUrl + "/search?entity_id=\(entityId)"
        guard let urlRequest = getRequest(url: urlString) else {
            // handle when something that request didn't happe cause of an error
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(false, nil, error)
                return
            }
            do{
                let decoder = JSONDecoder()
                let responseData = try? decoder.decode(T.self, from: data)
                completion(true, responseData, nil)
            }
        }.resume()
    }
    
    fileprivate func getRequest(url urlStr: String?) -> URLRequest? {
        guard let urlString: String = urlStr, let url = URL(string: urlString) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("26a8ad6f6001bd293eb60334d0b69d2b", forHTTPHeaderField: "user-key")
        return urlRequest
    }
}

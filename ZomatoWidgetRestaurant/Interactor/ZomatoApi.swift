//
//  File.swift
//  ZomatoWidgetRestaurant
//
//  Created by Amirthy Tejeshwar on 27/08/20.
//  Copyright © 2020 Amirthy Tejeshwar. All rights reserved.
//

import Foundation


class ZomatoApi {
    
    let baseUrl = "https://developers.zomato.com/api/v2.1"
    
    func getResponse() {
        let urlString = baseUrl + "/search?entity_id=6"
        guard let urlRequest = getRequest(url: urlString) else {
            // handle when something that request didn't happe cause of an error
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data else {
                print("Error inside guard let")
                return }
            do{
                print(data)
                let decoder = JSONDecoder()
                /// TODO decoding the response
                let searchResults = try? decoder.decode(Search.self, from: data)
                guard let search = searchResults else{ return }
                DispatchQueue.main.async {
                    print(search.resultsStart)
                    //self.updateWeatherDataWithModel(weatherStruct: weather)
                }
                
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

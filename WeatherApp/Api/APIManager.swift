//
//  APIManager.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/14/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    static func getWeather(at location: Location, onComplete: @escaping (String?, Error?) -> Void) {
        
        let root = "https://api.darksky.net/forecast/"
        
        let key = APIKeys.APIKey
        
        let url = "\(root)\(key)/\(location.latitude),\(location.longitude)"
        
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                onComplete("\(value)", nil)
            case .failure(let error):
                onComplete(nil, error)
            }
        }
    }
}
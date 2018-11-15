//
//  APIManager.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/14/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation
import Alamofire
//APIManager struct
struct APIManager {
    static func getWeather(at location: Location, onComplete: @escaping (String?, Error?) -> Void) {
        //Root of Url
        let root = "https://api.darksky.net/forecast/"
        //APIKey
        let key = APIKeys.APIKey
        //Full URL
        let url = "\(root)\(key)/\(location.latitude),\(location.longitude)"
        
        //Alamofire request
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
                //case for success
            case .success(let value):
                onComplete("\(value)", nil)
                //case for failure
            case .failure(let error):
                onComplete(nil, error)
            }
        }
    }
}

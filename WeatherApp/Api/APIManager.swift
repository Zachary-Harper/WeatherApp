//
//  APIManager.swift
//  WeatherApp
//
//  Created by Zachary Harper on 11/14/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
//APIManager struct
struct APIManager {
    
    enum APIErrors: Error {
        case noData , noResponse, invalidData
    }
    
    private let googleURL = ""
    
    
    static func getWeather(at location: Location, onComplete: @escaping (WeatherData?, Error?) -> Void) {
        //Root of Url
        let root = "https://api.darksky.net/forecast/"
        //APIKey
        let key = APIKeys.darkSkyAPIKey
        //Full URL
        let url = "\(root)\(key)/\(location.latitude),\(location.longitude)"
        
        //Alamofire request
        Alamofire.request(url).responseJSON { (response) in
         //case for success
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let weatherData = WeatherData(json: json) {
                    onComplete(weatherData, nil)
                }else {
                    onComplete(nil, APIErrors.invalidData)
                }
                
                
                //case for failure
            case .failure(let error):
                onComplete(nil, error)
            }
        }
    }
}
